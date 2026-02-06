{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.zathura;
in {
  options = {
    userSettings.zathura = {
      enable = lib.mkEnableOption "Enable zathura pdf viewer";
    };
  };
  config = lib.mkIf cfg.enable {
    catppuccin.zathura.enable = true;
    programs.zathura = {
      enable = true;
    };
  };
}
