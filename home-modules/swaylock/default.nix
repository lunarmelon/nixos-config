{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.userSettings.swaylock;
in {
  options = {
    userSettings.swaylock = {
      enable = lib.mkEnableOption "Enable swaylock";
    };
  };
  config = lib.mkIf cfg.enable {
    catppuccin.swaylock.enable = true;
    # Apparently, swayidle starts before mango, so it doesn't "see" the wayland session.
    # We need to force swayidle to wait until the wayland session has started.
    systemd.user.services.swayidle = {
      Unit = {
        After = ["graphical-session.target"];
        ConditionEnvironment = lib.mkForce "";
      };
      Service = {
        Environment = lib.mkForce "WAYLAND_DISPLAY=wayland-0";
        ExecStartPre = "${pkgs.coreutils}/bin/sleep 2";
        RestartSec = "5s";
      };
      Install.WantedBy = ["graphical-session.target"];
    };
    programs.swaylock = {
      enable = true;
      package = pkgs.swaylock-effects;
      settings = {
        image = ./phos_head.jpg;
        font = "JetBrainsMono Nerd Font";
        font-size = 44;
        indicator-radius = 200;
        show-failed-attempts = true;
        ignore-empty-password = true;

        # swaylock-effects specific
        clock = true;
        indicator = true;
        timestr = "%H:%M";
        datestr = "%a %d-%b";
        effect-blur = "7x5";
        effect-vignette = "0.5:0.5";
        grace = 2;
      };
    };
    services.swayidle = {
      enable = true;
      timeouts = [
        {
          # Turnoff screen
          timeout = 180;
          command = "${pkgs.wlopm}/bin/wlopm --off '*'";
          resumeCommand = "${pkgs.wlopm}/bin/wlopm --on '*'";
        }
        {
          # Lock the screen
          timeout = 300;
          command = "${pkgs.swaylock-effects}/bin/swaylock";
        }
        {
          # Suspend
          timeout = 600;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
      events = {
        "before-sleep" = "${pkgs.swaylock-effects}/bin/swaylock";
        "lock" = "${pkgs.swaylock-effects}/bin/swaylock";
      };
    };
  };
}
