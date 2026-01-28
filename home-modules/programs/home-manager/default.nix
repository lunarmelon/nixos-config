{pkgs, ...}: {
  config = {
    home = {
      stateVersion = "25.11";
      username = "melon";
      homeDirectory = "/home/melon";
      packages = with pkgs; [
        nil
        nixd
        nixdoc
      ];
    };
  };
}
