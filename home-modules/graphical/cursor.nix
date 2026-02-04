{pkgs, ...}: {
  home = {
    packages = with pkgs; [
      bibata-cursors
    ];
    sessionVariables = {
      XCURSOR_THEME = "Bibata-Modern-Dark";
      XCURSOR_SIZE = "24";
    };
    pointerCursor = {
      gtk.enable = true;
      x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };
  gtk = {
    enable = true;
    cursorTheme = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
  };
}
