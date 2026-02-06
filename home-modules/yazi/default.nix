{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.yazi;
in {
  options = {
    userSettings.yazi = {
      enable = lib.mkEnableOption "Enable yazi file manager";
    };
  };
  config = lib.mkIf cfg.enable {
    catppuccin.yazi.enable = true;
    programs.yazi = {
      enable = true;
    };
  };
}
