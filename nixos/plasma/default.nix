{
  # Enable the KDE Plasma Desktop Environment.
  services = {
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      settings.General.DisplayServer = "wayland";
    };
    desktopManager.plasma6.enable = true;
  };
}
