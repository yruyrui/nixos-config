{ pkgs, ... }:
{
  programs.nixvim = {
    defaultEditor = true;

    clipboard = {
      register = "unnamedplus";
      providers = {
        wl-copy = {
          enable = true;
          package = pkgs.wl-clipboard;
        };
      };
    };

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      number = true;

      # Set tabs to 4 spaces
      tabstop = 4;
      softtabstop = 4;
      showtabline = 0;
      expandtab = true;

      smartindent = true;
      shiftwidth = 4;
      breakindent = true;

      # Enable ignorecase + smartcase for better searching
      ignorecase = true;
      smartcase = true; # Don't ignore case with capitals

      termguicolors = true;
      cursorline = true;
    };

    viAlias = true;
    vimAlias = true;

    colorschemes.cyberdream.enable = true;
  };
}
