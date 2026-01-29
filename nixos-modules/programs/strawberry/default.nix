{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.systemSettings.strawberry;
in {
  options = {
    systemSettings.strawberry = {
      enable = lib.mkEnableOption "Enable strawberry music player";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      strawberry
    ];
  };
}
