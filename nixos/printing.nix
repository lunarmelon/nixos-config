# Configure printers
{
  # Enable CUPS to print documents.
  services.printing = {
    enable = true;
    openFirewall = true; # Open ports for printing
  };
}
