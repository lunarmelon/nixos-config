{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.systemSettings.services.apparmor;
in {
  options = {
    systemSettings.services.apparmor = {
      enable = lib.mkEnableOption "Enable apparmor";
    };
  };
  config = lib.mkIf cfg.enable {
    security.apparmor = {
      enable = true;
      enableCache = true;
      packages = with pkgs; [
        apparmor-profiles
      ];
    };
    services.dbus.apparmor = "enabled";
  };
}
