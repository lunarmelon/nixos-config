{
  config,
  lib,
  pkgs,
  ...
}: let
  browser = ["librewolf.desktop" "chromium.desktop"];
  editor = ["nvim.desktop"];
  fileManager = ["nemo.desktop"];
  office = ["onlyoffice-desktopeditors.desktop"];
  terminal = ["kitty.desktop"];
  video = ["mpv.desktop"];
  viewer = ["zathura.desktop"];
  associations = {
    "application/json" = editor;
    "application/pdf" = viewer;
    "application/rss+xml" = editor;
    "application/vnd.ms-excel" = office;
    "application/vnd.ms-powerpoint" = office;
    "application/vnd.ms-word" = office;
    "application/vnd.oasis.opendocument.database" = ["libreoffice-base.desktop"];
    "application/vnd.oasis.opendocument.formula" = ["libreoffice-math.desktop"];
    "application/vnd.oasis.opendocument.graphics" = ["libreoffice-draw.desktop"];
    "application/vnd.oasis.opendocument.graphics-template" = ["libreoffice-draw.desktop"];
    "application/vnd.oasis.opendocument.presentation" = office;
    "application/vnd.oasis.opendocument.presentation-template" = office;
    "application/vnd.oasis.opendocument.spreadsheet" = office;
    "application/vnd.oasis.opendocument.spreadsheet-template" = office;
    "application/vnd.oasis.opendocument.text" = office;
    "application/vnd.oasis.opendocument.text-master" = office;
    "application/vnd.oasis.opendocument.text-template" = office;
    "application/vnd.oasis.opendocument.text-web" = office;
    "application/vnd.openxmlformats-officedocument.presentationml.presentation" = office;
    "application/vnd.openxmlformats-officedocument.presentationml.template" = office;
    "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = office;
    "application/vnd.openxmlformats-officedocument.spreadsheetml.template" = office;
    "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = office;
    "application/vnd.openxmlformats-officedocument.wordprocessingml.template" = office;
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
    "inode/directory" = fileManager;
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
      extraPortals = with pkgs; [
        xdg-desktop-portal-gtk
        xdg-desktop-portal-wlr
        gnome-keyring
      ];
      config = {
        common = {
          default = [
            "gtk"
          ];
          "org.freedesktop.impl.portal.Access" = "gtk";
          "org.freedesktop.impl.portal.Account" = "gtk";
          "org.freedesktop.impl.portal.AppChooser" = "gtk";
          "org.freedesktop.impl.portal.Device" = "gtk";
          "org.freedesktop.impl.portal.DynamicLauncher" = "gtk";
          "org.freedesktop.impl.portal.Email" = "gtk";
          "org.freedesktop.impl.portal.FileChooser" = "gtk";
          "org.freedesktop.impl.portal.Lockdown" = "gtk";
          "org.freedesktop.impl.portal.Notification" = "gtk";
          "org.freedesktop.impl.portal.Print" = "gtk";
          "org.freedesktop.impl.portal.Screencast" = "gtk";
          "org.freedesktop.impl.portal.Screenshot" = "gtk";
          "org.freedesktop.impl.portal.Secret" = "gnome-keyring";
        };
        mango = lib.mkIf config.userSettings.mango.enable {
          default = [
            "wlr"
            "gtk"
          ];
          "org.freedesktop.impl.portal.ScreenCast" = "wlr";
          "org.freedesktop.impl.portal.Screenshot" = "wlr";
        };
      };
    };
  };
}
