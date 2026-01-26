{
  imports = [
    ./boot/bootloader.nix
    ./boot/kernel.nix
    ./fonts
    ./hardware
    ./locale.nix
    ./nix-settings.nix
    ./power.nix
    ./printing.nix
    ./programs
    ./shell
    ./users.nix
  ];
}
