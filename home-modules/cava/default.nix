{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.cava;
in {
  options = {
    userSettings.cava = {
      enable = lib.mkEnableOption "Enable cava visualizer";
    };
  };
  config = lib.mkIf cfg.enable {
    catppuccin.cava.enable = true;
    programs.cava = {
      enable = true;
    };
  };
}
