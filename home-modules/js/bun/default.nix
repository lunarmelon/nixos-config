{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.programming.bun;
in {
  options = {
    userSettings.programming.bun = {
      enable = lib.mkEnableOption "Enable bun js runtime";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.bun = {
      enable = true;
    };
  };
}
