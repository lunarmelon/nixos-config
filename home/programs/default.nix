{pkgs, ...}: {
  imports = [
    ./alacritty
    ./bun
    ./fastfetch
    ./git
    ./gpg
    ./keepassxc
    ./kitty
    ./lazygit
    ./librewolf
    ./mpv
    ./newsboat
    ./npm
    ./oh-my-posh
    ./onlyoffice
    ./tmux
    ./ungoogled-chromium
    ./utils
    ./vscode
    ./xdg
    ./zsh
  ];
  home.packages = with pkgs; [
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

    # languages
    python3
    lua
    gcc

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
