{
  services = {
    smartd.enable = true;
    fwupd.enable = true; # For firmware updates

    # Accounts daemon is needed to remember passwords and other account information
    # by display manager and other services
    accounts-daemon.enable = true;
    dbus = {
      enable = true;
      implementation = "broker"; # use new dbus-broker
    };
    udev.enable = true;
  };
}
