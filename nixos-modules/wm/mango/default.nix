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
    programs.mango.enable = true;

    xdg.portal = {
      enable = true;
      xdgOpenUsePortal = true;
      config.common.default = ["gtk"];
      wlr.enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
        xdg-desktop-portal
      ];
    };
    environment.systemPackages = [
      pkgs.glib
      pkgs.xdg-utils
      pkgs.wf-recorder
      pkgs.xwayland-satellite
    ];
  };
}
