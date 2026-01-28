{
  # Set your time zone.
  time.timeZone = "America/Mexico_City";

  # Synchronize system clock
  services.timesyncd.enable = true;

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,latam";
    variant = "";
  };
}
