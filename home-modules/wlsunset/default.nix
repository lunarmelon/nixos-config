{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.wlsunset;
in {
  options = {
    userSettings.wlsunset = {
      enable = lib.mkEnableOption "Enable wlsunset";
    };
  };
  config = lib.mkIf cfg.enable {
    services.wlsunset = {
      enable = true;
      sunrise = "07:00";
      sunset = "19:00";
      temperature = {
        day = 6500;
        night = 4100;
      };
    };
  };
}
