{
  imports = [
    ./hardware-configuration.nix
  ];

  config = {
    systemSettings = {
      bluetooth.enable = true;
      flatpak.enable = true;
      printing.enable = true;
    };
    networking.hostName = "lain-hp";
  };
}
