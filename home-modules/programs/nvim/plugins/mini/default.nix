{
  plugins.mini = {
    enable = true;
    mockDevIcons = true;
  };

  imports = [
    ./animate.nix
    ./clue.nix
    ./comment.nix
    ./files.nix
    ./icons.nix
    ./pairs.nix
    ./surround.nix
    ./tabline.nix
  ];
}
