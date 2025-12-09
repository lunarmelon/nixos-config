{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "lunarmelon";
        email = "lunarmelon@tuta.io";
      };
      init.defaultBranch = "main";
    };
    signing = {
      format = "openpgp";
      key = "DEE01CFFE2B917FA";
      signByDefault = true;
    };
  };
}
