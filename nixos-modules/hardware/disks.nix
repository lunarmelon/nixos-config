{pkgs, ...}: {
  fileSystems = {
    "/".options = [
      "defaults"
      "noatime"
      # "version_upgrade=incompatible" # set this to forcefully upgrade the version
    ]; # disable access time updates
  };
  services.bcachefs.autoScrub.enable = true;
  boot.kernel.sysfs.fs.bcachefs.dm-0.dev-0.label = "NixOS-Root";
  # Enable ZRAM
  zramSwap = {
    enable = true;
    # this means that maximum 200% worth of physical memory size
    # can be utilised in zram, by using compression
    # this does not mean 200% of actual physical memory is used
    memoryPercent = 100;
  };

  # Enable ZSwap
  boot.kernel.sysfs.module.zswap.parameters.enabled = 1;
  boot.kernel.sysctl = {
    # Setting High swappiness can improve performance with zram
    "vm.swappiness" = 200;
    "vm.watermark_boost_factor" = 0;
    "vm.watermark_scale_factor" = 125;
    "vm.page-cluster" = 0;
    # Improve write and read performance
    # by caching pages in RAM
    # may cause OOM on large package builds
    # "vm.dirty_background_ratio" = 12;
  };

  # Automount USB and drives
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
  };
  environment.systemPackages = with pkgs; [
    fuseiso # to mount iso system images
  ];
}
