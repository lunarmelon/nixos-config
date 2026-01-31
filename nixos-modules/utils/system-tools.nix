{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pciutils # lspci
    usbutils # lsusb
    which
    btop
    htop
    ripgrep
    fzf
  ];
}
