{pkgs, ...}: {
  imports = [
    ./brave-browser
    ./fastfetch
    ./git
    ./gpg
    ./kitty
    ./lazygit
    ./librewolf
    ./mpv
    ./oh-my-posh
    ./xdg
    ./zsh
  ];
  home.packages = with pkgs; [
    keepassxc

    # archives
    zip
    unzip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # misc
    which
    gnutar
    btop # replacement of htop/nmon
    python3
    lua

    # system tools
    pciutils # lspci
    usbutils # lsusb
    fastfetch

    alejandra
    deadnix
    statix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    imports = [./nvim];
  };
}
