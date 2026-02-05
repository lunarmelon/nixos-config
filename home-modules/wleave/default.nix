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
    home.packages = [pkgs.wayland-logout];
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
          {
            label = "logout";
            action = "wayland-logout";
            text = "Logout";
            keybind = "e";
            icon = "${pkgs.wleave}/share/wleave/icons/logout.svg";
          }
          {
            label = "shutdown";
            action = "systemctl poweroff";
            text = "Shutdown";
            keybind = "s";
            icon = "${pkgs.wleave}/share/wleave/icons/shutdown.svg";
          }
        ];
      };
    };
  };
}
