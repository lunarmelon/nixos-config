{inputs, ...}: {
  imports = [
    inputs.nixvim.homeModules.nixvim
    ./programs
  ];

  home.username = "melon";
  home.homeDirectory = "/home/melon";

  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "25.11";
}
