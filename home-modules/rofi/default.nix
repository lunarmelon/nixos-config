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
        icon-theme = "Papirus Dark";
        show-icons = true;
        drun-display-format = "{icon} {name}";
        disable-history = false;
        sidebar-mode = false;
        display-drun = " ";
        display-run = " ";
        display-window = " ";

        # adding vim keybindings
        kb-row-up = "Up,Control+k";
        kb-row-left = "Left,Control+h";
        kb-row-right = "Right,Control+l";
        kb-row-down = "Down,Control+j";

        kb-accept-entry = "Control+z,Control+y,Return,KP_Enter";

        # fixing up
        kb-remove-to-eol = "";
        kb-move-char-back = "Control+b";
        kb-remove-char-back = "BackSpace";
        kb-move-char-forward = "Control+f";
        kb-mode-complete = "Control+o";
      };
    };
  };
}
