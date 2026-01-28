{
  programs.nixvim = {
    enable = true;
    imports = [
      ./core
      ./lsp
      ./plugins
    ];
  };
}
