{
  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    imports = [
      ./core
      ./lsp
      ./plugins
    ];
  };
}
