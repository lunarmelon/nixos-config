{pkgs, ...}: {
  config = {
    home = {
      stateVersion = "26.05";
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
