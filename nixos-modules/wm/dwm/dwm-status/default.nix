{
  config,
  lib,
  ...
}: let
  cfg = config.systemSettings.dwm.dwm-status;
in {
  options = {
    systemSettings.dwm.dwm-status = {
      enable = lib.mkEnableOption "Enable dwm-status bar";
    };
  };
  config = {
    services.dwm-status = lib.mkIf cfg.enable {
      enable = true;
      settings = {
        order = [
          "battery"
          "backlight"
          "audio"
          "time"
        ];
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
