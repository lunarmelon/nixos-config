{
  plugins.lint = {
    enable = true;
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
        "BufReadPost"
        "BufWritePost"
        "InsertLeave"
      ];
    };
    lintersByFt = {
      nix = [
        "deadnix"
        "statix"
      ];
    };
  };
}
