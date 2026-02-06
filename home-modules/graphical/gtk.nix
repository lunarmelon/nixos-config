{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    sassc
    gtk-engine-murrine
    gnome-themes-extra
  ];
  gtk = {
    enable = true;
    colorScheme = "dark";
    font = {
      name = "Fira Sans";
      size = 11;
    };
    theme = {
      package = pkgs.yaru-theme;
      name = "Yaru-purple-dark";
    };
    gtk3 = {
      bookmarks = [
        "file:///tmp"
      ];
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };
  dconf.settings."org/gtk/settings/file-chooser" = {
    sort-directories-first = true;
  };
  # GTK4 Setup
  dconf.settings."org/gnome/desktop/interface" = {
    gtk-theme = lib.mkForce "Yaru-purple-dark";
    color-scheme = "prefer-dark";
  };
}
