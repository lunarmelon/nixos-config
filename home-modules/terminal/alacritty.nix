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
    programs.alacritty = {
      enable = true;
      cursor = {
        style.shape = "Beam";
      };
    };
  };
}
