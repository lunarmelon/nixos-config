{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    baseIndex = 1;
    extraConfig = ''
      set -g set-clipboard on
      set -g status-interval 3

      unbind r
      bind r source-file ~/.config/tmux/tmux.config

      set -g renumber-windows on

      set -g status-position top
      set -g status-left " "
      set -g status-right " "

      set -g cursor-style bar
      set -g renumber-windows on
    '';
    focusEvents = true;
    historyLimit = 1000000;
    keyMode = "vi";
    mouse = true;
    prefix = "C-space";
    terminal = "screen-256color";
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.resurrect
      {
        plugin = tmuxPlugins.continuum;
        extraConfig = "set -g @resurrect-capture-pane-contents 'on'";
      }
      {
        plugin = tmuxPlugins.catppuccin;
        extraConfig = "set -g @catppuccin_flavor 'mocha'";
      }
    ];
  };
}
