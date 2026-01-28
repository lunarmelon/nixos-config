{pkgs, ...}: {
  plugins.typescript-tools = {
    enable = true;
    settings = {
      settings = {
        tsserver_path = "${pkgs.typescript}/lib/node_modules/typescript/lib/tsserver.js";
      };
    };
  };
}
