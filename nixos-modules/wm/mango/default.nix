{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.systemSettings.mango;
in {
  options = {
    systemSettings.mango = {
      enable = lib.mkEnableOption "Enable mango wayland compositor";
    };
  };
  config = lib.mkIf cfg.enable {
    services.upower.enable = true;
    programs.dconf.enable = true;
    programs.mango.enable = true;
    environment.systemPackages = with pkgs; [
      glib
      xdg-utils
      wf-recorder
      xwayland-satellite
      swaybg
      bibata-cursors
      networkmanagerapplet
    ];
  };
}
