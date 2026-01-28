{
  plugins.conform-nvim = {
    enable = true;
    lazyLoad.settings = {
      cmd = "ConformInfo";
      event = "BufWrite";
    };
    autoInstall.enable = true;
    settings = {
      format_on_save = {
        timeout_ms = 500;
        lsp_fallback = true;
      };
      formatters_by_ft = {
        astro = ["prettierd"];
        c = ["clang-format"];
        cpp = ["clang-format"];
        css = ["biome" "biome-check" "biome-organize-imports"];
        html = ["prettierd"];
        javascript = ["biome" "biome-check" "biome-organize-imports"];
        javascriptreact = ["biome" "biome-check" "biome-organize-imports"];
        json = ["biome" "biome-check" "biome-organize-imports"];
        jsonc = ["biome" "biome-check" "biome-organize-imports"];
        lua = ["stylua"];
        markdown = ["prettierd"];
        markdown_inline = ["prettierd"];
        nix = ["alejandra"];
        python = ["ruff_fix" "ruff_format" "ruff_organize_imports"];
        sh = ["shfmt"];
        toml = ["taplo"];
        typescript = ["biome" "biome-check" "biome-organize-imports"];
        typescriptreact = ["biome" "biome-check" "biome-organize-imports"];
        yaml = ["prettierd"];
        zsh = ["beautysh"];
      };
    };
  };
}
