{
  config,
  lib,
  pkgs,
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
    home.packages = with pkgs; [
      wl-clipboard
    ];
    services = {
      cliphist.enable = true;
      gnome-keyring.enable = true;
      wl-clip-persist.enable = true;
    };
    xdg.configFile."mango/config.conf".source = ./config.conf;
  };
}
