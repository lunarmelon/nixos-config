{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.userSettings.wleave;
in {
  options = {
    userSettings.wleave = {
      enable = lib.mkEnableOption "Enable wleave";
    };
  };
  config = lib.mkIf cfg.enable {
    # catppuccin.wleave = {
    #   enable = true;
    #   iconStyle = "wlogout";
    # };
    programs.wleave = {
      enable = true;
      settings = {
        buttons = [
          {
            label = "lock";
            action = "swaylock";
            text = "Lock";
            keybind = "l";
            icon = "${pkgs.wleave}/share/wleave/icons/lock.svg";
          }
        ];
      };
    };
  };
}
