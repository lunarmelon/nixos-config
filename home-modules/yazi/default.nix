{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.userSettings.yazi;
in {
  options = {
    userSettings.yazi = {
      enable = lib.mkEnableOption "Enable yazi file manager";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      exiftool
    ];
    catppuccin.yazi.enable = true;
    programs.yazi = {
      enable = true;
      settings = {
        opener = {
          play = [
            {
              run = ''mpv "$@"'';
              desc = "mpv";
              orphan = true;
              for = "unix";
            }
          ];
          pdff = [
            {
              run = ''zathura "$@"'';
              desc = "zathura";
              block = true;
              for = "unix";
            }
          ];
          edit = [
            {
              run = ''nvim "$@"'';
              desc = "neovim";
              block = true;
            }
          ];
          system = [
            {
              run = "xdg-open \"$@\"";
              desc = "System default";
            }
          ];
        };
        open = {
          prepend_rules = [
            {
              mime = "text/*";
              use = "edit";
            }
            {
              mime = "application/pdf";
              use = ["pdff" "reveal"];
            }
            {
              name = "*";
              use = "system";
            }
          ];
        };
      };
    };
  };
}
