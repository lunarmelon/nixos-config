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
      xserver = {
        enable = true;
        windowManager.dwm = {
          enable = true;
          package = pkgs.dwm.overrideAttrs {
            src = ../../../home-modules/suckless/dwm;
          };
        };
      };
      displayManager = {
        sddm.enable = true;
      };
    };
  };
}
