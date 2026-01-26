# Configure bluetooth settings
{
  hardware.bluetooth = {
    enable = true;
    settings.General = {
      Experimental = true; # enable bluetooth battery percentage features
    };
  };
}
