{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.userSettings.nemo;
in {
  options = {
    userSettings.nemo = {
      enable = lib.mkEnableOption "Enable nemo file manager";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      nemo-with-extensions
    ];
  };
}
