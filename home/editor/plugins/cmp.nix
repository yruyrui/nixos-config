{
  programs.nixvim.plugins = {
    cmp-buffer = {enable = true;};

    cmp-emoji = {enable = true;};

    cmp-nvim-lsp = {enable = true;};

    cmp-path = {enable = true;};

    cmp_luasnip = {enable = true;};

    cmp = {
      enable = true;
      settings = {
        completion = {
          autocomplete = [
            "require('cmp.types').cmp.TriggerEvent.TextChanged"
          ];
        };
      };
      autoEnableSources = true;
      settings = {
        experimental = {
          ghostText = {
            enabled = true;
          };
        };
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 5;
        };
        snippet = {
          expand = "function(args) require('luasnip').lsp_expand(args.body)  end";
        };
        sources = [
          {name = "copilot";}
          {
            name = "path"; # file system paths
          }
          {name = "nvim_lsp";}
          {
            name = "luasnip"; # snippets
          }
          {
            name = "buffer"; # text within current buffer
            option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            keywordLength = 3;
          }
        ];

        window = {
          completion = {
            border = "solid";
          };
          documentation = {
            border = "solid";
          };
        };

        mapping = {
          "<C-Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<C-j>" = "cmp.mapping.select_next_item()";
          "<C-k>" = "cmp.mapping.select_prev_item()";
          "<C-e>" = "cmp.mapping.abort()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<Tab>" = "cmp.mapping.confirm({ select = true })";
          "<S-Tab>" = "cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })";
        };
      };
    };
  };
}
