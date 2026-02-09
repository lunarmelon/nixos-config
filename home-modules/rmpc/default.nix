{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.rmpc;
in {
  options = {
    userSettings.rmpc = {
      enable = lib.mkEnableOption "Enable rmpc mpd player";
    };
  };
  config = lib.mkIf cfg.enable {
    # mpd tui
    programs.rmpc = {
      enable = true;
      config = ''
        (
          address: "127.0.0.1:6600",
          password: None,
          enable_config_hot_reload: true,
          cache_dir: None,
          on_song_change: None,
          volume_step: 5,
          max_fps: 30,
          scrolloff: 0,
          wrap_navigation: false,
          enable_mouse: true,
          select_current_song_on_change: false,
          album_art: (
            method: Auto,
            max_size_px: (width: 500, height: 500),
            disabled_protocols: ["http://", "https://"],
            vertical_align: Center,
            horizontal_align: Center,
          ),
        )
      '';
    };
  };
}
