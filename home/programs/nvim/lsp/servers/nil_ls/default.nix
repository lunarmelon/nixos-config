{
  lsp.servers.nil_ls = {
    enable = true;
    config = {
      settings = {
        filetypes = ["nix"];
        nil = {
          nix = {
            flake = {
              autoArchive = true;
              autoEvalInputs = true;
            };
          };
        };
      };
    };
  };
}
