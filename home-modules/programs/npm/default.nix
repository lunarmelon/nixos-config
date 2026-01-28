{pkgs, ...}: {
  programs.npm = {
    enable = true;
    package = pkgs.nodejs_24;
    # https://blog.npmjs.org/post/141702881055/package-install-scripts-vulnerability
    settings = {
      prefix = "\${HOME}/.npm";
      ignore-scripts = true;
    };
  };
}
