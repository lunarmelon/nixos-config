{pkgs, ...}: {
  imports = [
    ./alacritty
    ./bun
    ./fastfetch
    ./git
    ./gpg
    ./home-manager
    ./keepassxc
    ./kitty
    ./lazygit
    ./librewolf
    ./mpv
    ./newsboat
    ./nvim
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
}
