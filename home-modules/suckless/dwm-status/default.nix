{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.suckless.dwm-status;
in {
  options = {
    userSettings.suckless.dwm-status = {
      enable = lib.mkEnableOption "Enable dwm-status bar";
    };
  };
  config = {
    services.dwm-status = lib.mkIf cfg.enable {
      enable = true;
      order = [
        "battery"
        "backlight"
        "audio"
        "time"
      ];
      extraConfig = {
        separator = " | ";
        backlight = {
          icons = [
            "󰃞"
            "󰃟"
            "󰃠"
          ];
          template = "{ICO} {BL}%";
        };
        audio = {
          icons = [
            "󰕿"
            "󰖀"
            "󰕾"
          ];
          template = "{ICO} {VOL}%";
        };
        time = {
          format = "%a %d-%b %H:%M ";
          update_seconds = true;
        };
      };
    };
  };
}
