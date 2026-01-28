{
  config,
  lib,
  ...
}: let
  cfg = config.userSettings.nvim;
in {
  options = {
    userSettings.nvim = {
      enable = lib.mkEnableOption "Enable neovim";
    };
  };
  config = lib.mkIf cfg.enable {
    programs.nixvim = {
      enable = true;
      imports = [
        ./core
        ./lsp
        ./plugins
      ];
    };
  };
}
