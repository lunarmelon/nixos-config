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

    # Enable flakes
    experimental-features = [
      "nix-command"
      "flakes"
    ];
    cores = 0;
    auto-optimise-store = true; # enable space optimisation by hardlinking
  };
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  environment.sessionVariables.NIXPKGS_ALLOW_UNFREE = "1";
}
