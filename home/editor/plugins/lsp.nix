{
  inputs,
  pkgs,
  ...
}:
{
  programs.nixvim.plugins = {
    lsp-format = {
      enable = true;
      lspServersToEnable = "all";
    };

    lsp-signature = {
      enable = true;
    };

    lsp = {
      enable = true;
      servers = {
        # Bash
        bashls.enable = true;
        # lua
        lua_ls.enable = true;
        # C++
        clangd.enable = true;
        # Nix
        nil_ls.enable = true;
        # Python
        ruff.enable = true;
        # Tex
        texlab.enable = true;
        # Zig
        zls = {
          enable = true;
          package = inputs.zls.packages.${pkgs.stdenv.hostPlatform.system}.zls;
        };
      };
    };
  };
}
