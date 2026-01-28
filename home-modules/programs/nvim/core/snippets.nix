{lib, ...}: {
  # Prevent LSP from overwriting treesitter color settings
  # https://github.com/NvChad/NvChad/issues/1907
  #extraConfigLuaPre = ''vim.highlight.priorities.semantic_tokens = 95; -- Or any number lower than 100, treesitter's priority level'';
  diagnostic.settings = {
    virtual_text = false;
    virtual_lines = true;
  };
  # diagnostic.settings = {
  #   virtual_text = {
  #     prefix = "●";
  #     # Add a custom format function to show error codes
  #     format = lib.nixvim.mkRaw ''
  #       function(diagnostic)
  #           local code = diagnostic.code and string.format("[%s]", diagnostic.code) or ""
  #           return string.format("%s %s", code, diagnostic.message)
  #       end '';
  #   };
  #   underline = false;
  #   update_in_insert = true;
  #   float = {
  #     source = true; # Or "if_many"
  #   };
  #   # Make diagnostic background transparent
  #   on_ready = lib.nixvim.mkRaw ''
  #     function()
  #        vim.cmd("highlight DiagnosticVirtualText guibg=NONE")
  #     end'';
  # };
}
