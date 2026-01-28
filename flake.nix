{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    # home-manager, used for managing user configuration
    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
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

  outputs = inputs @ {
    nixpkgs,
    nix-flatpak,
    nixvim,
    home-manager,
    ...
  }: {
    nixosConfigurations = {
      lain-hp = nixpkgs.lib.nixosSystem {
        modules = [
          ./hosts/hp-laptop/configuration.nix
          ./nixos
          nix-flatpak.nixosModules.nix-flatpak
          # make home-manager as a module of nixos
          # so that home-manager configuration will be deployed automatically when executing `nixos-rebuild switch`
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              users.melon.imports = [
                ./home/home.nix
              ];
              sharedModules = [nixvim.homeModules.nixvim];
            };
          }
        ];
      };
    };
  };
}
