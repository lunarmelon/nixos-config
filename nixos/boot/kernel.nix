{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.systemSettings.kernel;
in {
  options = {
    systemSettings.kernel = {
      enable = lib.mkEnableOption "Enable Linux kernel";
      variant = lib.mkOption {
        default = null;
        # Choose between default linux kernel or CachyOS kernels
        type = lib.types.nullOr (lib.types.enum ["default" "cachy" "cachy-lto" "cachy-lts" "cachy-hardened"]);
        description = "This option determines the kernel variant to use";
      };
    };
  };
  config = lib.mkIf cfg.enable {
    boot.kernelPackages = lib.mkMerge [
      (lib.mkIf (cfg.variant == null) pkgs.linuxPackages_latest)
      (lib.mkIf (cfg.variant == "default") pkgs.linuxPackages_latest)
      (lib.mkIf (cfg.variant == "cachy") pkgs.linuxPackages_cachyos)
      (lib.mkIf (cfg.variant == "cachy-lto") pkgs.linuxPackages_cachyos-lto)
      (lib.mkIf (cfg.variant == "cachy-lts") pkgs.linuxPackages_cachyos-lts)
      (lib.mkIf (cfg.variant == "cachy-hardened") pkgs.linuxPackages_cachyos-hardened)
    ];
    services.scx = {
      enable = true;
      package = pkgs.scx.rustscheds;
      scheduler = "scx_lavd";
    };
    boot.consoleLogLevel = 0;
  };
}
