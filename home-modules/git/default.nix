{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.git;
in {
  options = {
    userSettings.git = {
      enable = lib.mkEnableOption "Enable git";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      lfs.enable = true;
      settings = {
        user = {
          name = "lunarmelon";
          email = "lunarmelon@tuta.io";
        };
        init.defaultBranch = "main";
      };
      signing = {
        format = "openpgp";
        key = "DEE01CFFE2B917FA";
        signByDefault = true;
      };
    };
    programs.gh.enable = true;
  };
}
