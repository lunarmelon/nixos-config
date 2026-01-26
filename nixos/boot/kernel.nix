# This config file is used to configure the kernel
{pkgs, ...}: {
  boot.kernelPackages = pkgs.linuxPackages_latest;
}
