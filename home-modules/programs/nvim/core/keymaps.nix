{
  globals = {
    mapleader = " ";
    maplocalleader = " ";
  };
  keymaps = [
    # Disable spacebar key's default behavior in Normal and Visual modes
    {
      mode = [
        "n"
        "v"
      ];
      action = "<Nop>";
      key = "<Space>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Save file
    {
      mode = "n";
      action = ":w<CR>";
      key = "<C-s>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Quit file
    {
      mode = "n";
      action = ":q<CR>";
      key = "<C-q>";
      options = {
        noremap = true;
        silent = true;
      };
    }

    # Buffers
    {
      mode = "n";
      action = ":bnext<CR>";
      key = "<Tab>";
      options = {
        noremap = true;
        silent = true;
        desc = "Next buffer";
      };
    }
    {
      mode = "n";
      action = ":bprevious<CR>";
      key = "<S-Tab>";
      options = {
        noremap = true;
        silent = true;
        desc = "Previous buffer";
      };
    }
    {
      mode = "n";
      action = ":bdelete!<CR>";
      key = "<leader>x";
      options = {
        noremap = true;
        silent = true;
        desc = "Close buffer";
      };
    }

    # Mini.files
    {
      mode = "n";
      action = ":lua MiniFiles.open(vim.api.nvim_buf_get_name(0))<CR>";
      key = "<leader>e";
      options = {
        noremap = true;
        silent = true;
        desc = "Open at current dir";
      };
    }
    {
      mode = "n";
      action = ":lua MiniFiles.open()<CR>";
      key = "<leader>el";
      options = {
        noremap = true;
        silent = true;
        desc = "Open in last used state";
      };
    }

    # Lazygit
    {
      mode = "n";
      action = ":LazyGit<CR>";
      key = "<leader>lg";
      options = {
        noremap = true;
        silent = true;
        desc = "Open LazyGit";
      };
    }
  ];
}
