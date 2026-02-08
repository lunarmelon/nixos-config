{pkgs, ...}: let
  browser = ["librewolf.desktop" "chromium.desktop"];
  editor = ["nvim.desktop"];
  office = ["onlyoffice-desktopeditors.desktop"];
  terminal = ["kitty.desktop"];
  viewer = ["zathura.desktop"];
  video = ["mpv.desktop"];
  associations = {
    "application/json" = editor;
    "application/msword" = office;
    "application/pdf" = viewer;
    "application/rss+xml" = editor;
    "application/vnd.ms-excel" = office;
    "application/vnd.ms-powerpoint" = office;
    "application/vnd.oasis.opendocument.presentation" = office;
    "application/vnd.oasis.opendocument.spreadsheet" = office;
    "application/vnd.oasis.opendocument.text" = office;
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = office;
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = office;
    "application/vnd.openxmlformats-officedocument.presentationml.presentation" = office;
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-m4a" = video;
    "application/x-extension-mp4" = video;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/x-flac" = video;
    "application/x-pdf" = viewer;
    "application/x-quicktime-media-link" = video;
    "application/x-quicktimeplayer" = video;
    "application/x-shellscript" = editor;
    "application/x-smil" = video;
    "application/xhtml+xml" = browser;
    "application/xml" = browser;
    "audio/*" = video;
    "text/*" = editor;
    "text/html" = browser;
    "text/plain" = editor;
    "video/*" = video;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/chrome" = browser;
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/terminal" = terminal;
    "x-scheme-handler/unknown" = browser;
    "x-www-browser" = browser;
  };
in {
  xdg = {
    enable = true;
    mime.enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = associations;
      associations.added = associations;
    };
    userDirs = {
      enable = true;
      createDirectories = true;
    };
    portal = {
      enable = true;
      xdgOpenUsePortal = true;
      extraPortals = with pkgs; [xdg-desktop-portal-gtk xdg-desktop-portal-wlr];
      config = {
        common.default = "gtk";
        mango = {
          default = ["wlr"];
        };
        pantheon = {
          default = [
            "pantheon"
            "gtk"
          ];
          "org.freedesktop.impl.portal.Secret" = [
            "gnome-keyring"
          ];
        };
      };
    };
  };
}
