{
  lib,
  config,
  ...
}: let
  cfg = config.systemSettings.flatpak;
in {
  options = {
    systemSettings.flatpak = {
      enable = lib.mkEnableOption "Enable flatpaks";
    };
  };
  config = lib.mkIf cfg.enable {
    services.flatpak = {
      enable = true;
      packages = [
        "org.prismlauncher.PrismLauncher"
      ];
    };
  };
}
