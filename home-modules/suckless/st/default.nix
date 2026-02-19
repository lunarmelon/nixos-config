{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.userSettings.suckless.st;
in {
  options = {
    userSettings.suckless.st = {
      enable = lib.mkEnableOption "Enable st";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      (st.overrideAttrs (_: {
        src = ./st;
        patches = [];
      }))
    ];
  };
}
