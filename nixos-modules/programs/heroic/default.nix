{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.systemSettings.heroic;
in {
  options = {
    systemSettings.heroic = {
      enable = lib.mkEnableOption "Enable Heroic Games Launcher";
    };
  };
  config = lib.mkIf cfg.enable {
    nixpkgs.config.packageOverrides = pkgs: {
      heroic = pkgs.heroic.override {
        extraPkgs = pkgs:
          with pkgs; [
            gamemode
          ];
      };
    };
    environment.systemPackages = with pkgs; [
      heroic
    ];
  };
}
