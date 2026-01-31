{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.systemSettings.programming;
in {
  options = {
    systemSettings.programming = {
      enable = lib.mkEnableOption "Enable programming utilities";
    };
  };
  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      dotnet-sdk_10
      go
      libgcc
      lua
      perl
      python3
      rustc
    ];
  };
}
