{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.systemSettings.dwm.dwmblocks;
  dwmblocks = pkgs.dwmblocks.overrideAttrs {
    src = ./dwmblocks;
  };
in {
  options = {
    systemSettings.dwm.dwmblocks = {
      enable = lib.mkEnableOption "Enable dwmblocks";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      dwmblocks
    ];
    # Autostart dwmblocks
    services.xserver.displayManager.sessionCommands = ''
      dwmblocks &
    '';
  };
}
