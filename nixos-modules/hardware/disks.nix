{pkgs, ...}: {
  services = {
    devmon.enable = true;
    gvfs.enable = true;
    udisks2.enable = true;
  };
  environment.systemPackages = with pkgs; [
    baobab # disk usage analyzer
    fuseiso # to mount iso system images
  ];
}
