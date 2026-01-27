{
  imports = [
    ./hardware-configuration.nix
  ];

  config = {
    systemSettings = {
      bluetooth.enable = true;
    };
    networking.hostName = "lain-hp";
  };
}
