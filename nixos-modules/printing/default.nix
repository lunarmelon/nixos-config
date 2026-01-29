{
  pkgs,
  lib,
  config,
  ...
}: let
  cfg = config.systemSettings.printing;
in {
  options = {
    systemSettings.printing = {
      enable = lib.mkEnableOption "Enable printing";
    };
  };
  config = lib.mkIf cfg.enable {
    services.printing = {
      enable = true;
      openFirewall = true; # Open ports for printing
    };
    environment.systemPackages = [pkgs.cups-filters pkgs.hplip];
  };
}
