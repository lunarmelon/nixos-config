{
  config,
  inputs,
  lib,
  osConfig,
  pkgs,
  ...
}: let
  cfg = config.userSettings.stylix;
  theme = import (./. + "../../../themes" + ("/" + config.userSettings.stylix.theme));
in {
  options = {
    userSettings.stylix = {
      enable = lib.mkEnableOption "Enable stylix theming";
    };
    userSettings.stylix.theme = lib.mkOption {
      default =
        if osConfig.stylix.enable
        then osConfig.systemSettings.stylix.theme
        else "io";
      type = lib.types.enum (builtins.attrNames (lib.filterAttrs (name: type: type == "directory") (builtins.readDir ../../themes)));
      description = "Theme for stylix to use for the user";
    };
  };
  config = lib.mkIf cfg.enable {
    home.file.".currenttheme".text = config.userSettings.stylix.theme;
    stylix = {
      enable = true;
      autoEnable = false;
      polarity = theme.polarity;
      base16Scheme = theme;
      fonts = {
        # TODO abstract fonts into an option
        monospace = {
          name = "JetBrainsMono Nerd Font";
          package = pkgs.nerd-fonts.jetbrains-mono;
        };
        serif = {
          name = "Fira Sans";
          package = pkgs.fira-sans;
        };
        sansSerif = {
          name = "Fira Sans";
          package = pkgs.fira-sans;
        };
        emoji = {
          name = "Twitter Color Emoji";
          package = pkgs.twitter-color-emoji;
        };
        sizes = {
          terminal = 14;
          applications = 11;
          popups = 11;
          desktop = 11;
        };
      };
      targets = {
        alacritty.enable = true;
        kitty.enable = true;
      };
    };
  };
}
