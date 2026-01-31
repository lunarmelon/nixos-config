{pkgs, ...}: {
  config = {
    home = {
      stateVersion = "25.11";
      username = "melon";
      homeDirectory = "/home/melon";
      shell.enableZshIntegration = true;
      packages = with pkgs; [
        nil
        nixd
        nixdoc

        # archives
        zip
        unzip
        p7zip
        gnutar
        gzip

        # utils
        which
        btop
        htop
        ripgrep
        fzf

        # system tools
        pciutils # lspci
        usbutils # lsusb
      ];
    };
  };
}
