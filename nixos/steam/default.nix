{pkgs, ...}: {
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
    extraCompatPackages = with pkgs; [proton-ge-bin];
  };
  # Tip: For improved gaming performance, you can also enable GameMode:
  programs.gamemode.enable = true;
}
