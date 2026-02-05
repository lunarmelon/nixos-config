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
    programs.yazi = {
      enable = true;
    };
  };
}
