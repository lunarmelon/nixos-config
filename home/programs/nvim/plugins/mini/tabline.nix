{lib, ...}: {
  highlightOverride = {
    MiniTablineCurrent = {
      fg = "#89b4fa";
      bg = "NONE";
      bold = true;
    };
    MiniTablineModifiedCurrent = {
      fg = "#f9e2af";
      bg = "NONE";
      bold = true;
    };
    MiniTablineModifiedVisible = {
      fg = "#f9e2af";
      bg = "NONE";
      bold = false;
    };
    MiniTablineVisible = {
      fg = "#89b4fa";
      bg = "NONE";
      bold = false;
    };
    MiniTablineHidden = {
      fg = "#6c7086";
      bg = "NONE";
      bold = false;
    };
    MiniTablineModifiedHidden = {
      fg = "#7e7256";
      bg = "NONE";
      bold = false;
    };
  };
  plugins.mini.modules.tabline = {
    settings = {
      format = lib.nixvim.mkRaw ''
        function(buf_id, label)
            local suffix = vim.bo[buf_id].modified and "● " or ""
            return MiniTabline.default_format(buf_id, label) .. suffix
        end, '';
    };
  };
}
