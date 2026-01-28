{
  lib,
  pkgs,
  ...
}: {
  plugins.lint = {
    enable = true;
    lazyLoad.settings = {
      event = ["BufWritePost" "BufReadPost" "InsertLeave"];
    };
    autoCmd = {
      callback = {
        __raw = ''
          function()
            require('lint').try_lint()
          end
        '';
      };
      desc = "Lint on read, write, and insert leave";
      event = [
        "BufWritePost"
        "InsertLeave"
      ];
    };
    linters = {
      deadnix = {
        cmd = lib.getExe pkgs.deadnix;
      };
      htmlhint = {
        cmd = lib.getExe pkgs.htmlhint;
      };
      selene = {
        cmd = lib.getExe pkgs.deadnix;
      };
      shellcheck = {
        cmd = lib.getExe pkgs.shellcheck;
      };
      statix = {
        cmd = lib.getExe pkgs.statix;
      };
    };
    lintersByFt = {
      css = ["biomejs"];
      html = ["htmlhint"];
      javascript = ["biomejs"];
      javascriptreact = ["biomejs"];
      json = ["biomejs"];
      jsonc = ["biomejs"];
      lua = ["selene"];
      nix = [
        "deadnix"
        "statix"
      ];
      python = ["ruff"];
      sh = ["shellcheck"];
      typescript = ["biomejs"];
      typescriptreact = ["biomejs"];
    };
  };
}
