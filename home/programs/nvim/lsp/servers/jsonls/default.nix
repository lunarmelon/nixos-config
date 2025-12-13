{lib, ...}: {
  plugins.lsp.servers.jsonls = {
    enable = true;
    settings = {
      json = {
        schemas = lib.nixvim.mkRaw ''require("schemastore").json.schemas()'';
        validate.enable = true;
      };
    };
  };
}
