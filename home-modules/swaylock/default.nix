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
          # Lock the screen
          timeout = 60;
          command = "${pkgs.swaylock-effects}/bin/swaylock -fF";
        }
        {
          # Suspend
          timeout = 90;
          command = "${pkgs.systemd}/bin/systemctl suspend";
        }
      ];
      events = {
        "before-sleep" = "${pkgs.swaylock-effects}/bin/swaylock -fF";
        "lock" = "lock";
      };
    };
  };
}
