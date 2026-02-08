{
  lib,
  pkgs,
  ...
}: {
  home.packages = with pkgs; [
    gnome-themes-extra
  ];
  home.sessionVariables = {
    GTK_THEME = "Yaru-purple-dark";
  };
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
      extraConfig.gtk-application-prefer-dark-theme = true;
    };
  };
  dconf.settings."org/gtk/settings/file-chooser" = {
    sort-directories-first = true;
  };
  # GTK4 Setup
  dconf.settings."org/gnome/desktop/interface" = {
    document-font-name = "Fira Sans 11";
    gtk-theme = lib.mkForce "Yaru-purple-dark";
    color-scheme = "prefer-dark";
  };
}
