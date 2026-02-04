{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.userSettings.suckless.dmenu;
in {
  options = {
    userSettings.suckless.dmenu = {
      enable = lib.mkEnableOption "Enable dmenu";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      (dmenu.overrideAttrs (_: {
        src = ./dmenu;
        patches = [];
      }))
    ];
  };
}
