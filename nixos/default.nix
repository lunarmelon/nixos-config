{
  imports = [
    ./boot/bootloader.nix
    ./boot/kernel.nix
    ./flatpak.nix
    ./fonts
    ./hardware
    ./locale.nix
    ./nix-settings.nix
    ./plasma
    ./power.nix
    ./printing.nix
    ./programs
    ./shell
    ./users.nix
  ];
}
