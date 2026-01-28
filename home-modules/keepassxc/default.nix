{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.keepassxc;
in {
  options = {
    userSettings.keepassxc = {
      enable = lib.mkEnableOption "Enable keepassxc";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.keepassxc.enable = true;
  };
}
