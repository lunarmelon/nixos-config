{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.userSettings.obs;
in {
  options = {
    userSettings.obs = {
      enable = lib.mkEnableOption "Enable OBS";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.obs-studio.enable = true;
    programs.obs-studio.plugins = with pkgs.obs-studio-plugins; [
      obs-gstreamer
      obs-vaapi
      wlrobs
    ];
  };
}
