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
            "dwl/window#title"
          ];
          modules-right = [
            "custom/sep"
            "battery"
            "custom/sep"
            "network"
            "custom/sep"
            "clock"
            "custom/sep"
            "tray"
          ];
          clock = {
            format-alt = "{:%Y-%m-%d}";
          };
          cpu = {
            format = "CPU: {usage}%";
            tooltip = false;
          };
          memory = {
            format = "Mem: {used}GiB";
          };
          disk = {
            interval = 60;
            path = "/";
            format = "Disk: {free}";
          };
          battery = {
            states = {
              good = 95;
              warning = 30;
              critical = 15;
            };
            format = "Bat: {capacity}% {icon} {time}";
            format-plugged = "{capacity}% ";
            format-alt = "Bat {capacity}%";
            format-time = "{H}:{M}";
            format-icons = [
              ""
              ""
              ""
              ""
              ""
            ];
          };
          network = {
            format = "Online";
            format-disconnected = "Disconnected";
          };
          "ext/workspaces" = {
            format = "{icon}";
            ignore-hidden = false;
            on-click = "activate";
            sort-by-id = true;
          };
          "dwl/tags" = {
            num-tags = 9;
          };
          "dwl/window#layout" = {
            format = "[{layout}]";
          };
          "dwl/window#title" = {
            format = "{title}";
          };
          "custom/sep" = {
            format = "|";
            interval = 0;
          };
        };
      };
    };
  };
}
