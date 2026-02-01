{
  config,
  lib,
  ...
}: let
  cfg = config.systemSettings.services.firewall;
in {
  options = {
    systemSettings.services.firewall = {
      enable = lib.mkEnableOption "Activate firewall with ports open only for Syncthing";
    };
  };
  config = lib.mkIf cfg.enable {
    # Firewall
    networking.firewall = {
      enable = true;
      # Open ports in the firewall.
      allowedTCPPorts = [22000 21027]; # syncthing
      allowedUDPPorts = [22000 21027]; # syncthing
    };
    # Or disable the firewall altogether.
    # networking.firewall.enable = false;
  };
}
