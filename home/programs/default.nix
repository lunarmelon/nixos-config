{pkgs, ...}: {
  imports = [
    ./alacritty
    ./brave-browser
    ./bun
    ./fastfetch
    ./git
    ./gpg
    ./keepassxc
    ./kitty
    ./lazygit
    ./librewolf
    ./mpv
    ./npm
    ./oh-my-posh
    ./tmux
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
  ];

  home.shell.enableZshIntegration = true;

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    imports = [./nvim];
  };
}
