{pkgs, ...}: {
  programs.librewolf = {
    enable = true;
    settings = {
      "privacy.clearOnShutdown.history" = false;
      "browser.newtabpage.activity-stream.trendingSearch.defaultSearchEngine" = "StartPage";
      "browser.policies.runOncePerModification.setDefaultSearchEngine" = "StartPage";
      "identity.fxaccounts.enabled" = true;
    };
    profiles = {
      "default" = {
        id = 0;
        name = "default";
        path = "default";
        search = {
          force = true;
        };
        extensions = {
          force = true;
          packages = with pkgs.nur.repos.rycee.firefox-addons; [ublock-origin decentraleyes];
          settings."uBlock0@raymondhill.net".settings = {
            selectedFilterLists = [
              "ublock-filters"
              "ublock-badware"
              "ublock-privacy"
              "ublock-unbreak"
              "ublock-quick-fixes"
            ];
          };
        };
      };
      "melon" = {
        id = 1;
        name = "melon";
        path = "melon";
      };
    };
  };
}
