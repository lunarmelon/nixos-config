{
  colorschemes.catppuccin = {
    enable = true;
    settings = {
      default_integrations = true;
      flavour = "mocha";
      integrations = {
        blink-cmp = true;
        markview = true;
        mini.enable = true;
        lsp_styles = {
          virtual_text = {
            errors = ["italic"];
            hints = ["italic"];
            warnings = ["italic"];
            information = ["italic"];
          };
          underlines = {
            errors = ["underline"];
            hints = ["underline"];
            warnings = ["underline"];
            information = ["underline"];
          };
          inlay_hints = {
            background = true;
          };
        };
        noice = true;
        treesitter = true;
      };
      show_end_of_buffer = false;
      term_colors = true;
    };
  };
}
