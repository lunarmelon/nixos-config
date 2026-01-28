{
  nix.settings = {
    # Features for building
    system-features = [
      # Defaults
      "benchmark"
      "big-parallel"
      "kvm"
      "nixos-test"
    ];

    # Substituters
    substituters = [
      "https://cache.nixos.org"
      "https://nix-community.cachix.org"
    ];
    trusted-public-keys = [
      "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

    # Enable flakes
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    cores = 0;
    auto-optimise-store = true; # enable space optimisation by hardlinking
    trusted-users = ["@wheel"]; # wheel group gets trusted access to nix daemon
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment = {
    sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
    pathsToLink = ["/share/xdg-desktop-portal" "/share/applications"];
  };

  system.stateVersion = "25.05";
}
