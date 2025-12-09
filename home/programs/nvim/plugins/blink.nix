{
  plugins.luasnip.enable = true;
  plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        keymap = {
          "<S-Tab>" = [
            "select_prev"
            "fallback"
          ];
          "<Tab>" = [
            "select_next"
            "fallback"
          ];
          "<CR>" = [
            "accept"
            "fallback"

          ];
        };
        appearance = {
          nerd_font_variant = "mono";
          kind_icons = {
            Array = "󰅪";
            Class = "";
            Color = "󰏘";
            Constant = "󰏿";
            Constructor = "";
            Enum = "";
            EnumMember = "";
            Event = "";
            Field = "󰜢";
            File = "󰈙";
            Folder = "󰉋";
            Function = "󰆧";
            Interface = "";
            Keyword = "󰌋";
            Method = "󰆧";
            Module = "";
            Operator = "󰆕";
            Property = "󰜢";
            Reference = "󰈇";
            Snippet = "";
            Struct = "";
            Text = "";
            TypeParameter = "";
            Unit = "";
            Value = "";
            Variable = "󰀫";
          };
        };
        completion = {
          documentation = {
            auto_show = false;
          };
        };
        snippets = {
          preset = "luasnip";
        };
        sources = {
          default = [
            "lsp"
            "path"
            "snippets"
            "buffer"
          ];
        };
        fuzzy = {
          implementation = "prefer_rust_with_warning";
        };
      };
      luaConfig.post = ''opts_extend = {"sources.default"} '';
    };
  };
}
