{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Themes
    kdePackages.breeze-gtk
    kdePackages.breeze-icons
    kdePackages.breeze.qt5
    kdePackages.breeze
    catppuccin-papirus-folders # Icon theme, e.g. for pcmanfm-qt
    papirus-folders # For the catppucing stuff work
  ];
  catppuccin.gtk.icon.enable = true;
  qt = {
    enable = true;
    platformTheme = "gtk2";
    style = "breeze";
  };
}
