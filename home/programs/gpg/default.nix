{
  config,
  pkgs,
  ...
}: {
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-qt;
  };
  programs.gpg = {
    enable = true;
    homedir = "${config.xdg.dataHome}/gnupg";
  };
}
