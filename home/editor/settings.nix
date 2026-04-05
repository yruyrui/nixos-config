{pkgs, ...}: {
  programs.nixvim = {
    defaultEditor = true;

    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    opts = {
      number = true;
    };

    viAlias = true;
    vimAlias = true;

    colorschemes.cyberdream.enable = true;
  };
}
