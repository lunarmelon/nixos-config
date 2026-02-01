{
  config = {
    systemSettings = {
      # Users
      users = ["melon"];
      adminUsers = ["melon"];

      # Hardware
      kernel.enable = true;
      kernel.variant = "default";
      bluetooth.enable = true;
      printing.enable = true;

      # Software
      flatpak.enable = true;
      plasma.enable = true;
      prism-launcher.enable = true;
      steam.enable = true;
      strawberry.enable = true;

      # Services
      services = {
        ananicy-cpp.enable = true;
        apparmor.enable = true;
        firewall.enable = true;
        #firejail.enable = true;
      };

      # Programming
      programming.enable = true;

      # WM
      awesome.enable = true;
      dwm.enable = true;

      # Style
      stylix = {
        enable = true;
        theme = "catppuccin-mocha";
      };
    };

    users.users.melon.description = "Melon";
  };
}
