{pkgs, ...}: {
  config = {
    home = {
      stateVersion = "25.11";
      username = "melon";
      homeDirectory = "/home/melon";
      shell.enableZshIntegration = true;
      packages = with pkgs; [
        nil
        nixd
        nixdoc
      ];
    };
  };
}
