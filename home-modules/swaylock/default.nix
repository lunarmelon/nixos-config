{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.swaylock;
in {
  options = {
    userSettings.swaylock = {
      enable = lib.mkEnableOption "Enable swaylock";
    };
  };
  config = lib.mkIf cfg.enable {
    catppuccin.swaylock.enable = true;
    programs.swaylock = {
      enable = true;
    };
  };
}
