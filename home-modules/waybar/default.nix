{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.waybar;
in {
  options = {
    userSettings.waybar = {
      enable = lib.mkEnableOption "Enable waybar";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.waybar = {
      enable = true;
      style = ./style.css;
      settings = {
        mainBar = {
          modules-left = [
            "ext/workspaces"
            "custom/sep"
            "dwl/window#layout"
            "custom/sep"
            "dwl/window#title"
          ];
          modules-right = [
            "custom/sep"
            "battery"
            "custom/sep"
            "network"
            "custom/sep"
            "cpu"
            "custom/sep"
            "memory"
            "custom/sep"
            "disk"
            "custom/sep"
            "clock"
            "custom/sep"
            "tray"
          ];
          clock = {
            format-alt = "{:%Y-%m-%d}";
          };
        };
      };
    };
  };
}
