{
  plugins.lazygit = {
    enable = true;
    lazyLoad.settings = {
      cmd = [
        "LazyGit"
        "LazyGitConfig"
        "LazyGitCurrentFile"
        "LazyGitFilter"
        "LazyGitFilterCurrentFile"
      ];
      keys = "<leader>lg";
    };
  };
}
