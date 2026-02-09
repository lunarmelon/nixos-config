{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.mpd;
in {
  options = {
    userSettings.mpd = {
      enable = lib.mkEnableOption "Enable mpd";
    };
  };
  config = lib.mkIf cfg.enable {
    # activate the service
    services.mpd = {
      enable = true;
      network.startWhenNeeded = true; # systemd feature: only start MPD service upon connection to its socket
      extraConfig = ''
        audio_output {
          type        "pulse"
          name        "Pulse Audio"
          mixer_type  "software"
        }
        audio_output {
          type        "fifo"
          name        "Visualizer"
          path        "/tmp/mpd.fifo"
          format      "44100:16:2"
        }
      '';
    };
  };
}
