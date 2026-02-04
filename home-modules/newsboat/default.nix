{
  catppuccin.newsboat.enable = true;
  programs.newsboat = {
    enable = true;
    urls = [
      {url = "https://drewdevault.com/blog/index.xml";}
      {url = "https://vkc.sh/feed/";}
      {url = "https://fedoramagazine.org/feed/";}
      {url = "https://n0thanky0u.neocities.org/feed.xml";}
      {url = "https://www.debian.org/News/news";}
      {url = "https://thelinuxcast.org/feed/feed.xml";}
    ];
  };
}
