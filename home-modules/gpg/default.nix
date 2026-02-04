{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.userSettings.gpg;
in {
  options = {
    userSettings.gpg = {
      enable = lib.mkEnableOption "Enable GPG";
    };
  };
  config = lib.mkIf cfg.enable {
    services.gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-rofi;
      defaultCacheTtl = 28800;
      maxCacheTtl = 28800;
      enableSshSupport = true;
    };
    programs.gpg = {
      enable = true;
      homedir = "${config.xdg.dataHome}/gnupg";
    };
  };
}
