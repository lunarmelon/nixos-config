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
    # Theming framework for NixOS
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Mango wayland compositor
    mango = {
      url = "github:DreamMaoMao/mango";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    # Catppuccin
    catppuccin.url = "github:catppuccin/nix";
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
    devShells.${system}.suckless = pkgs.mkShell {
      packages = with pkgs; [
        pkg-config
        xorg.libX11
        xorg.libXft
        xorg.libXinerama
        fontconfig
        freetype
        harfbuzz
        gcc
        gnumake
      ];
    };
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

            # system modules
            ./nixos-modules

            # mango
            inputs.mango.nixosModules.mango

            #m catppuccin
            inputs.catppuccin.nixosModules.catppuccin

            # home manager
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                sharedModules = [
                  inputs.nixvim.homeModules.nixvim
                  inputs.mango.hmModules.mango
                  inputs.catppuccin.homeModules.catppuccin
                ];
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
