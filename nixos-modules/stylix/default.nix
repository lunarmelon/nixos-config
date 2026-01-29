{
  config,
  inputs,
  lib,
  pkgs,
  ...
}: let
  cfg = config.systemSettings.stylix;
  theme = import (./. + "../../../themes" + ("/" + config.systemSettings.stylix.theme));
in {
  options = {
    systemSettings.stylix = {
      enable = lib.mkEnableOption "Enable stylix theming";
    };
    systemSettings.stylix.theme = lib.mkOption {
      default = "catppuccin-mocha";
      type = lib.types.enum (builtins.attrNames (lib.filterAttrs (name: type: type == "directory") (builtins.readDir ../../themes)));
      description = "Theme for stylix to use system wide";
    };
  };
  imports = [inputs.stylix.nixosModules.stylix];
  config = lib.mkIf cfg.enable {
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
      };
      targets = {
        console.enable = true;
      };
    };
  };
}
