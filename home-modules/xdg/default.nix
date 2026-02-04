{pkgs, ...}: let
  browser = ["librewolf.desktop" "chromium.desktop"];
  editor = ["nvim.desktop"];
  terminal = ["kitty.desktop"];
  video = ["mpv.desktop"];
  associations = {
    "application/json" = editor;
    "application/rss+xml" = editor;
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-m4a" = video;
    "application/x-extension-mp4" = video;
    "application/x-extension-shtml" = browser;
    "application/x-extension-xht" = browser;
    "application/x-extension-xhtml" = browser;
    "application/x-flac" = video;
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
