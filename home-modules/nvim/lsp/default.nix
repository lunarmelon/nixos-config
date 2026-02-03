{
  imports = [./servers];
  plugins.lsp = {
    enable = true;
    servers.config.capabilities.textDocument.semanticTokens.multilineTokenSupport = true;
  };
}
