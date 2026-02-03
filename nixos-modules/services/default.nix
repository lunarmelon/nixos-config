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
  security = {
    sudo-rs = {
      enable = true;
      extraRules = [
        {
          groups = ["wheel"];
          host = "ALL";
          runAs = "ALL:ALL";
          commands = [
            {
              command = "/run/current-system/sw/bin/xbacklight";
              options = ["NOPASSWD"];
            }
          ];
        }
      ];
    };
  };
}
