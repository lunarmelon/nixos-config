{
  config,
  lib,
  pkgs,
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
    home.packages = with pkgs; [
      pavucontrol
    ];
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
            "idle_inhibitor"
            "custom/sep"
            "custom/layout"
            "custom/sep"
            "pulseaudio"
            "custom/sep"
            "network"
            "custom/sep"
            "battery"
            "custom/sep"
            "clock"
            "custom/sep"
            "tray"
          ];
          clock = {
            format = "{:%I:%M %p}";
            format-alt = "{:%a %d-%b}";
            tooltip = false;
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
            format = "{icon} {capacity}%";
            format-plugged = " {capacity}%";
            format-alt = "{capacity}%";
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
            on-click = "~/nixos-config/scripts/wifimenu.sh -J -w --rofi";
            on-click-right = "nm-connection-editor";
          };
          pulseaudio = {
            format = "{volume}% {icon}";
            format-bluetooth = "{volume}% ";
            format-muted = "";
            format-icons = {
              headphone = "";
              headset = "󰋎";
              default = [
                ""
                ""
              ];
            };
            on-click = "pavucontrol";
            on-click-right = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
          };
          idle_inhibitor = {
            format = "{icon}";
            format-icons = {
              activated = "";
              deactivated = "";
            };
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
            tooltip = false;
          };
          "custom/layout" = {
            exec = "mmsg -k | grep kb_layout | head -n 1 | awk '{print $NF}' | tr '[:lower:]' '[:upper:]'";
            interval = 3;
            format = "{}";
            signal = 1;
            tooltip = false;
          };
        };
      };
    };
  };
}
