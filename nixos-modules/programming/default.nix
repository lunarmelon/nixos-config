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
      cargo
      clang
      dotnet-sdk_10
      gnumake
      go
      libgcc
      llvmPackages.libcxxClang
      lua
      luarocks
      perl
      python3
      python313Packages.pip
      rustc
      virtualenv
    ];
  };
}
