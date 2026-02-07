{
  config,
  lib,
  pkgs,
  ...
}: let
  cfg = config.userSettings.screenshot;
in {
  options = {
    userSettings.screenshot = {
      enable = lib.mkEnableOption "Enable screenshot utilites";
    };
  };
  config = lib.mkIf cfg.enable {
    home.packages = with pkgs; [
      (pkgs.writeShellScriptBin "screenshot" ''
        FILENAME="${config.xdg.userDirs.pictures}/$(date +%Y%m%d_%H%M%S).png"

        if [ "$XDG_SESSION_TYPE" = "wayland" ]; then
            ${pkgs.grim}/bin/grim -g "$(${pkgs.slurp}/bin/slurp)" "$FILENAME"
            ${pkgs.wl-clipboard}/bin/wl-copy < "$FILENAME"
        else
            ${pkgs.maim}/bin/maim -s | tee "$FILENAME" | ${pkgs.xclip}/bin/xclip -selection clipboard -t image/png
        fi

        ${pkgs.libnotify}/bin/notify-send "Screenshot" "Saved and copied to clipboard"
      '')
      grim
      slurp
      maim
    ];
  };
}
