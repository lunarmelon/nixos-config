{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.mango;
in {
  options = {
    userSettings.mango = {
      enable = lib.mkEnableOption "Enable mango";
    };
  };
  config = lib.mkIf cfg.enable {
    xdg.configFile."mango/config.conf".source = ./config.conf;
  };
}
