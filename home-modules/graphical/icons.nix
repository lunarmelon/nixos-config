{pkgs, ...}: {
  home.packages = with pkgs; [
    whitesur-icon-theme
  ];
  gtk = {
    enable = true;
    iconTheme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-icon-theme;
    };
  };
}
