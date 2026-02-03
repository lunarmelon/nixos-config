{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.systemSettings.dwm;
in {
  options = {
    systemSettings.dwm = {
      enable = lib.mkEnableOption "Enable dwm window manager";
    };
  };
  config = lib.mkIf cfg.enable {
    services = {
      dwm-status = {
        enable = true;
        settings = {
          order = [
            "battery"
            "time"
          ];
          separator = " | ";
          time = {
            format = "%a %d-%b %H:%M ";
            update_seconds = true;
          };
        };
      };
      xserver = {
        enable = true;
        windowManager.dwm = {
          enable = true;
          package = pkgs.dwm.overrideAttrs {
            src = ./dwm;
          };
        };
      };
      displayManager = {
        sddm.enable = true;
      };
    };
  };
}
