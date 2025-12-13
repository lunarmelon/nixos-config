{
  imports = [./servers];
  plugins.schemastore.enable = true;
  plugins.lsp = {
    enable = true;
    servers = {
      astro.enable = true;
      bashls.enable = true;
      biome.enable = true;
      clangd.enable = true;
      cssls.enable = true;
      emmet_ls.enable = true;
      html.enable = true;
      jsonls.enable = true;
      lua_ls.enable = true;
      marksman.enable = true;
      ruff.enable = true;
      yamlls.enable = true;
    };
  };
}
