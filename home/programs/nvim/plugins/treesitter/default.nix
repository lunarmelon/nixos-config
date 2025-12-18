{pkgs, ...}: {
  plugins.treesitter-context.enable = true;
  plugins.treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      c
      css
      cpp
      go
      html
      java
      javascript
      json
      lua
      markdown
      markdown_inline
      nix
      python
      regex
      rust
      toml
      tsx
      typescript
      yaml
    ];
    settings = {
      highlight.enable = true;
      indent.enable = true;
      incremental_selection = {
        enable = true;
        keymaps = {
          init_selection = "<C-Space>";
          node_incremental = "<C-Space>";
          scope_incremental = "<C-s>";
          node_decremental = "<M-Space>";
        };
      };
    };
    nixvimInjections = true;
  };
}
