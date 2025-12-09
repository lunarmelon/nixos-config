{
  plugins.lualine = {
    enable = true;
    settings = {
      options = {
        icons_enabled = true;
        theme = "catppuccin-mocha";
        section_separators = {
          left = "";
          right = "";
        };
        component_separators = {
          left = "";
          right = "";
        };

      };
      sections = {
        lualine_a = [
          { __raw = ''{ "mode", fmt = function(str) return " ".. str end }, ''; }
        ];
        lualine_b = [ "branch" ];
        lualine_c = [ { __raw = ''{ "filename", file_status = true, path = 0, } ''; } ];
        lualine_x = [
          {
            __raw = ''
              {
                    "diagnostics", 
                    sources = { "nvim_lsp" }, 
                    sections = { "error", "warn" }, 
                    symbols = { error = " ", warn = " ", info = " ", hint = " " },
                    colored = false,
                    update_in_insert = false,
                    always_visible = false,
                    cond = hide_in_width,
              }
            '';
          }
          {
            __raw = ''
                {
                    "diff",
              		colored = false,
              		symbols = { added = " ", modified = " ", removed = " " },
              		cond = hide_in_width,
                }
            '';
          }
          { __raw = ''{ "filetype", cond = hide_in_width } ''; }
        ];
        lualine_y = [ "" ];
        lualine_z = [ "" ];
      };
    };
  };
}
