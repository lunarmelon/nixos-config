{pkgs, ...}: {
  imports = [
    ./brave-browser
    ./fastfetch
    ./git
    ./gpg
    ./keepassxc
    ./kitty
    ./lazygit
    ./librewolf
    ./mpv
    ./oh-my-posh
    ./utils
    ./xdg
    ./zsh
  ];
  home.packages = with pkgs; [
    # archives
    zip
    unzip

    # misc
    which
    gnutar
    btop # replacement of htop/nmon
    python3
    lua

    # system tools
    pciutils # lspci
    usbutils # lsusb

    alejandra
    deadnix
    statix
  ];

  home.shell.enableZshIntegration = true;

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    imports = [./nvim];
  };
}
