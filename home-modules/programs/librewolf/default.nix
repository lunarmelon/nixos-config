{pkgs, ...}: {
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
}
