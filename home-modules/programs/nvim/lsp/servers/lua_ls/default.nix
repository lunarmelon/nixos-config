{
  plugins.lsp.servers.lua_ls = {
    enable = true;
    settings = {
      Lua = {
        diagnostics = {
          globals = ["vim"];
          disable = ["missing-fields"];
        };
        runtime = {
          version = "LuaJIT";
        };
        workspace = {
          checkThirdParty = false;
        };
      };
    };
  };
}
