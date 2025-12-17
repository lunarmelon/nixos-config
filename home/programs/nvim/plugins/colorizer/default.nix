{
  plugins.colorizer = {
    enable = true;
    lazyload.settings = {
      event = ["BufReadPre"];
    };
    settings = {
      user_default_options = {
        names = false;
        tailwind = true;
      };
    };
  };
}
