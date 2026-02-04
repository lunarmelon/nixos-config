{
  config,
  lib,
  ...
}: let
  cfg = config.systemSettings.sddm;
in {
  options = {
    systemSettings.sddm = {
      enable = lib.mkEnableOption "Enable sddm";
    };
  };
  config = lib.mkIf cfg.enable {
    catppuccin = {
      sddm = {
        enable = true;
        font = "Fira Sans";
        fontSize = "12";
      };
    };

    services.displayManager.sddm = {
      enable = true;
      wayland = {
        enable = true;
        compositor = "kwin";
      };
      settings = {
        Theme = {
          CursorTheme = "Bibata-Modern-Classic";
          CursorSize = 24;
        };
      };
    };
  };
}
