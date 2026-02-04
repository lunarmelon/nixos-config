{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.alacritty;
in {
  options = {
    userSettings.alacritty = {
      enable = lib.mkEnableOption "Enable alacritty";
    };
  };
  config = lib.mkIf cfg.enable {
    catppuccin.alacritty.enable = true;
    programs.alacritty = {
      enable = true;
      settings.cursor = {
        style.shape = "Beam";
      };
    };
  };
}
