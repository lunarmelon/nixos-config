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
      prism-launcher.enable = true;
      steam.enable = true;

      # Security
      security = {
        automount.enable = true;
        #firejail.enable = true;
        firewall.enable = true;
      };
    };
    networking.hostName = "lain-hp";
  };
}
