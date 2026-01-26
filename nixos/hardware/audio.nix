# This conf file is used to configure audio and sound related settings
{
  # Enable sound via pipewire
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Enable rtkit for real-time scheduling, required for pipewire
  security.rtkit.enable = true;
}
