{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.systemSettings.awesome;
in {
  options = {
    systemSettings.awesome = {
      enable = lib.mkEnableOption "Enable awesome window manager";
    };
  };
  config = lib.mkIf cfg.enable {
    services = {
      xserver = {
        enable = true;
        windowManager.awesome = {
          enable = true;
          luaModules = with pkgs.luaPackages; [
            luarocks
            awesome-wm-widgets
          ];
        };
      };
      displayManager = {
        sddm.enable = true;
      };
    };
  };
}
