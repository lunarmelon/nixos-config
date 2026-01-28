{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    nixpkgs-stable.url = "nixpkgs/nixos-25.11";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Neovim distribution built around Nix modules
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Flatpak manager for NixOS
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
  };

  outputs = inputs @ {self, ...}: let
    system = "x86_64-linux";

    # create patched nixpkgs
    nixpkgs-patched = (import inputs.nixpkgs {inherit system;}).applyPatches {
      name = "nixpkgs-patched";
      src = inputs.nixpkgs;
      patches = [
        #(builtins.fetchurl {
        #  url = "https://asdf1234.patch";
        #  sha256 = "sha256:qwerty123456...";
        #})
      ];
    };

    # configure pkgs
    # use nixpkgs if running a server (homelab or worklab profile)
    # otherwise use patched nixos-unstable nixpkgs
    pkgs = import nixpkgs-patched {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };

    pkgs-stable = import inputs.nixpkgs-stable {
      inherit system;
      config = {
        allowUnfree = true;
        allowUnfreePredicate = _: true;
      };
    };
    # configure lib
    lib = inputs.nixpkgs.lib;

    # create a list of all directories inside of ./hosts
    # every directory in ./hosts has config for that machine
    hosts = builtins.filter (x: x != null) (
      lib.mapAttrsToList (name: value:
        if (value == "directory")
        then name
        else null) (
        builtins.readDir ./hosts
      )
    );
  in {
    # generate a nixos configuration for every host in ./hosts
    nixosConfigurations = builtins.listToAttrs (
      map (host: {
        name = host;
        value = lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            # host specific config
            {config.networking.hostName = host;}
            (./hosts + "/${host}")

            # my modules
            ./nixos

            # home manager
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [inputs.nixvim.homeModules.nixvim];
                extraSpecialArgs = {
                  inherit pkgs;
                  inherit pkgs-stable;
                  inherit inputs;
                };
              };
            }
            inputs.nix-flatpak.nixosModules.nix-flatpak
          ];
          specialArgs = {
            inherit pkgs-stable;
            inherit inputs;
          };
        };
      })
      hosts
    );
  };
}
