{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.userSettings.suckless.dwmblocks;
  dwmblocks = pkgs.dwmblocks.overrideAttrs {
    src = ./dwmblocks;
    preBuild = ''
      rm -f blocks.h
    '';
  };
in {
  options = {
    userSettings.suckless.dwmblocks = {
      enable = lib.mkEnableOption "Enable dwmblocks";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = [
      dwmblocks
    ];
    # Autostart dwmblocks
    xsession = {
      enable = true;
      initExtra = ''
        ${dwmblocks}/bin/dwmblocks &
      '';
    };
  };
}
