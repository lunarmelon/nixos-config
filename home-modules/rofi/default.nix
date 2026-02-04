{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.userSettings.rofi;
in {
  options = {
    userSettings.rofi = {
      enable = lib.mkEnableOption "Enable rofi";
    };
  };
  config = lib.mkIf cfg.enable {
    catppuccin.rofi.enable = true;
    programs.rofi = {
      enable = true;
      font = "JetBrainsMono Nerd Font 12";
      terminal = "${pkgs.kitty}/bin/kitty";
      extraConfig = {
        modi = [
          "drun"
          "window"
          "run"
        ];
        icon-theme = "WhiteSur-Dark";
        show-icons = true;
        drun-display-format = "{icon} {name}";
      };
    };
  };
}
