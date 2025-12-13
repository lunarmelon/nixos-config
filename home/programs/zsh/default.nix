{
  config,
  lib,
  ...
}: {
  programs.zsh = {
    enable = true;
    autocd = true;

    initContent = lib.mkOrder 1200 ''stty stop undef '';

    shellAliases = {
      nv = "nvim";
      ls = "eza";
      ll = "ls -lh";
    };

    dotDir = "${config.xdg.configHome}/zsh";

    history = {
      append = true;
      findNoDups = true;
      ignoreDups = true;
      ignoreSpace = true;
      path = "${config.xdg.dataHome}/zsh/zsh_history";
      saveNoDups = true;
      share = true;
      size = 1000000;
    };

    historySubstringSearch = {
      enable = true;
      searchDownKey = ["^[[B" "$terminfo[kcud1]"];
      searchUpKey = ["^[[A" "$terminfo[kcuu1]"];
    };

    setOptions = [
      "nobeep"
      "inc_append_history"
    ];

    zplug = {
      enable = true;
      plugins = [
        {name = "Aloxaf/fzf-tab";}
        {name = "zdharma-continuum/fast-syntax-highlighting";}
        {name = "zsh-users/zsh-completions";}
        {name = "zsh-users/zsh-autosuggestions";}
        {name = "zsh-users/zsh-history-substring-search";}
        {name = "hlissner/zsh-autopair";}
      ];
    };
    sessionVariables = {
      WGETRC = "$XDG_CONFIG_HOME/wget/wgetrc";
      GNUPGHOME = "$XDG_DATA_HOME/gnupg";
      CARGO_HOME = "$XDG_DATA_HOME/cargo";
      GOPATH = "$XDG_DATA_HOME/go";
      GOBIN = "$GOPATH/bin";
      GOMODCACHE = "$XDG_CACHE_HOME/go/mod";
      _JAVA_AWT_WM_NONREPARENTING = 1;
      FFMPEG_DATADIR = "$XDG_CONFIG_HOME/ffmpeg";
      WINEPREFIX = "$XDG_DATA_HOME/wineprefixes/default";
      BUN_INSTALL = "$XDG_DATA_HOME/bun";
      NVM_DIR = "$XDG_CONFIG_HOME/nvm";
    };
  };
}
