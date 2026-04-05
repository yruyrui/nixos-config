{
  programs.nixvim.plugins.telescope = {
    enable = true;

    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>fg" = "live_grep";
      "<leader>b" = "buffers";
      "<leader>fh" = "help_tags";
      "<leader>fc" = "command_history";
      "<leader>fd" = "diagnostics";
      "<leader>fk" = "keymaps";
      "<leader>fw" = "grep_string";
      "<leader>fs" = "builtin";
      "<leader>f." = "oldfiles";

      "<C-p>" = "git_files";
      "<leader>p" = "oldfiles";
      "<C-f>" = "live_grep";
    };

    settings.defaults = {
      file_ignore_patterns = [
        "^.git/"
        "^.mypy_cache/"
        "^__pycache__/"
        "^output/"
        "^data/"
      ];
      set_env.COLORTERM = "truecolor";
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<C-t>";
      action.__raw = ''
        function()
          require('telescope.builtin').live_grep({
            default_text="TODO",
            initial_mode="normal"
          })
        end
      '';
      options.silent = true;
      options.desc = "Search for TODO string";
    }
    {
      mode = "n";
      key = "<leader>/";
      action.__raw = ''
             function()
        require('telescope.builtin').current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
        			      winblend = 10,
        			      previewer = false,
        		      }))
             end
      '';
      options.desc = "Fuzzily search in current buffer";
    }
    {
      mode = "n";
      key = "<leader>f/";
      action.__raw = ''
             function()
        require('telescope.builtin').live_grep({
          grep_open_files = true,
          prompt_title = "Live Grep in Open Files"
        })
        end
      '';
      options.desc = "Fuzzily search in open files";
    }
  ];
}
