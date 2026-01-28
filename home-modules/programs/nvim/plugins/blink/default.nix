{
  plugins = {
    luasnip.enable = true;
    blink-cmp-git.enable = true;
    blink-cmp = {
      enable = true;
      setupLspCapabilities = true;
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
        signature.enabled = true;
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
            "git"
          ];
          providers = {
            git = {
              name = "Git";
              module = "blink-cmp-git";
              enabled = true;
              score_offset = 100;
            };
          };
        };
        fuzzy = {
          implementation = "prefer_rust_with_warning";
        };
      };
      luaConfig.post = ''opts_extend = {"sources.default"} '';
    };
  };
}
