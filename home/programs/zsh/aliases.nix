{
  programs.zsh.shellAliases = {
    # Package managers
    apt = "sudo apt";
    nala = "sudo nala";
    dnf = "sudo dnf";
    pac = "sudo pacman";

    # Python
    py = "python3";
    # Vim and Neovim
    v = "vim";
    nv = "nvim";

    # Git
    gst = "git status";
    ga = "git add";
    gaa = "git add --all";
    gc = "git commit";
    gcm = "git commit -m";
    gps = "git push";
    gpl = "git pull";
    gcl = "git clone";
    gs = "git switch";
    grh = "git reset --hard";
    grhead = "git reset HEAD";
    lg = "lazygit";

    # Newsboat
    nws = "newsboat";

    # Eza
    ls = "eza --group-directories-first --icons";
    ll = "ls -lh --git";
    ll = "ls -lh";
    la = "ll -a";
    tree = "ll --tree --level=2";
    # Display images in terminal with Kitty;
    icat = "kitten icat";
    # Misc;
    ff = "fastfetch";
    ht = "htop";
    bt = "btop";
    rel = "exec zsh";
  };
}
