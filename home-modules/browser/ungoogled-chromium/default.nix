{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.userSettings.chromium;
in {
  options = {
    userSettings.chromium = {
      enable = lib.mkEnableOption "Enable ungoogled-chromium";
    };
  };
  config = lib.mkIf cfg.enable {
    catppuccin.chromium.enable = true;
    programs.chromium = {
      enable = true;
      package = pkgs.ungoogled-chromium;
    };
  };
}
