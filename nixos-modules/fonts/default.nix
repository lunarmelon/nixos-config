{pkgs, ...}: {
  fonts = {
    enableDefaultPackages = true;
    packages = with pkgs; [
      corefonts
      inter
      fira
      noto-fonts
      noto-fonts-cjk-sans
      vista-fonts
    ];

    fontDir.enable = true;
    fontconfig = {
      subpixel.rgba = "rgb"; # Subpixel rendering
      antialias = true;
      hinting.enable = true;
      useEmbeddedBitmaps = true; # for better rendering of Calibri like fonts
      cache32Bit = true;
    };
  };
  # Console fonts
  console = {
    font = "ter-124b";
    keyMap = "us";
    packages = with pkgs; [
      terminus_font
    ];
  };
}
