{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.oh-my-posh;
in {
  options = {
    userSettings.oh-my-posh = {
      enable = lib.mkEnableOption "Enable oh-my-posh";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.oh-my-posh = {
      enable = true;
      configFile = ./melon.toml;
    };
  };
}
