{
  plugins.lsp.servers.nil_ls = {
    enable = true;
    settings = {
      nil.nix.flake = {
        autoArchive = true;
        autoEvalInputs = true;
      };
    };
  };
}
