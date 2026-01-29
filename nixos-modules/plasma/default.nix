{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.systemSettings.plasma;
in {
  options = {
    systemSettings.plasma = {
      enable = lib.mkEnableOption "Enable KDE Plasma";
    };
  };
  config = lib.mkIf cfg.enable {
    services = {
      displayManager.sddm = {
        enable = true;
        wayland.enable = true;
        settings.General.DisplayServer = "wayland";
      };
      desktopManager.plasma6.enable = true;
    };
    environment.systemPackages = with pkgs; [
      kdePackages.kate
      kdePackages.dolphin
      kdePackages.skanpage
      kdePackages.okular
      kdePackages.gwenview
    ];
    services.avahi.nssmdns4 = true;
  };
}
