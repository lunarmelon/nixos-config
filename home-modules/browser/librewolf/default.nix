{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.librewolf;
in {
  options = {
    userSettings.librewolf = {
      enable = lib.mkEnableOption "Enable Librewolf";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.librewolf = {
      enable = true;
      settings = {
        "privacy.clearOnShutdown.history" = false;
        "identity.fxaccounts.enabled" = true;
      };
      profiles = {
        "default" = {
          id = 0;
          name = "default";
          path = "default";
        };
      };
    };
  };
}
