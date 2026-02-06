{
  config,
  lib,
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
    catppuccin.yazi.enable = true;
    programs.yazi = {
      enable = true;
      settings = {
        opener = {
          pdff = [
            {
              run = ''zathura "$@"'';
              desc = "zathura";
              block = true;
              for = "unix";
            }
          ];
        };
        open = {
          rules = [
            {
              mime = "application/pdf";
              use = [
                "pdff"
                "reveal"
              ];
            }
          ];
        };
      };
    };
  };
}
