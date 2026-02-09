{
  config,
  lib,
  ...
}: let
  cfg = config.systemSettings.bluetooth;
in {
  options = {
    systemSettings.bluetooth = {
      enable = lib.mkEnableOption "Enable bluetooth";
    };
  };
  config = lib.mkIf cfg.enable {
    services.blueman.enable = true;
    hardware.bluetooth = {
      enable = true;
      settings.General = {
        Experimental = true; # enable bluetooth battery percentage features
        KernelExperimental = true;
      };
    };
  };
}
