{
  imports = [
    ./hardware-configuration.nix
  ];

  config = {
    systemSettings = {
      # Hardware
      kernel.enable = true;
      kernel.variant = "default";
      bluetooth.enable = true;
      printing.enable = true;

      # Software
      flatpak.enable = true;
      plasma.enable = true;

      # Security
      security = {
        automount.enable = true;
      };
    };
    networking.hostName = "lain-hp";
  };
}
