{
  programs.nixvim.plugins = {
    lsp-format = {
      enable = true;
      lspServersToEnable = "all";
    };

    lsp = {
      enable = true;
      servers = {
        # lua
        lua_ls.enable = true;
        # C++
        clangd.enable = true;
        # Zig
        zls.enable = true;
      };
    };
  };
}
