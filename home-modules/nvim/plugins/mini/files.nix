{
  plugins.mini.modules.files = {
    content = {
      filter.__raw = ''
        function(entry)
          return entry.name ~= '.git' and entry.name ~= '.direnv' and entry.name ~= '.envrc' and entry.name ~= '.gitlab' and entry.name ~= '.github'
        end'';
    };
  };
}
