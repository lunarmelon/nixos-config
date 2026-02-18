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
      systemd.enable = true;
      settings = {
        mainBar = {
          modules-left = [
            "ext/workspaces"
            "custom/sep"
            "dwl/window#title"
          ];
          modules-right = [
            "mpd"
            "custom/sep"
            "idle_inhibitor"
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
          battery = {
            states = {
              good = 95;
              warning = 30;
              critical = 15;
            };
            interval = 60;
            format = "{icon}{capacity}%";
            format-charging = "󱐋 {capacity}%";
            format-plugged = "󰂄 {capacity}%";
            format-alt = "{icon}%";
            format-time = "{H}:{M}";
            format-icons = [
              "󰁺 "
              "󰁻 "
              "󰁼 "
              "󰁽 "
              "󰁾 "
              "󰁿 "
              "󰂀 "
              "󰂁 "
              "󰂂 "
              "󰁹 "
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
            format-muted = "";
            format-icons = {
              headphone = "";
              headset = "󰋎";
              default = [
                ""
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
              activated = " ";
              deactivated = " ";
            };
          };
          mpd = {
            format = "{stateIcon} {artist} - {title} ({elapsedTime:%M:%S}/{totalTime:%M:%S})";
            format-disconnected = "󰝛 Disconnected";
            format-stopped = "";
            interval = 10;
            consume-icons = {
              on = "";
            };
            random-icons = {
              off = "<span color=\"#f38ba8\"></span> "; # Mocha Red
              on = "<span color=\"#a6e3a1\"></span> "; # Mocha Green
            };
            repeat-icons = {
              on = "";
            };
            single-icons = {
              on = "1";
            };
            state-icons = {
              paused = "";
              playing = "";
            };
            tooltip-format = "MPD (connected)";
            tooltip-format-disconnected = "MPD (disconnected)";
            on-click = "rmpc togglepause";
            on-click-right = "";
          };
          "ext/workspaces" = {
            format = "{icon}";
            ignore-hidden = true;
            on-click = "activate";
            sort-by-id = true;
          };
          "dwl/tags" = {
            num-tags = 5;
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
        };
      };
    };
  };
}
