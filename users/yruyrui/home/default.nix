{
  isWSL,
  inputs,
  currentSystemName,
  ...
}:

{
  config,
  lib,
  pkgs,
  ...
}:

{

  imports = [
    inputs.nixvim.homeModules.nixvim
    ./vim
  ];

  home.username = "yruyrui";
  home.homeDirectory = "/home/yruyrui";

  xdg.enable = true;

  home.file = {
    ".emacs.d/init.el".source = ../config/emacs/init.el;
    ".emacs.d/early-init.el".source = ../config/emacs/early-init.el;
  };

  xdg.configFile =
    builtins.foldl' (acc: name: acc // { "${name}".text = builtins.readFile ../config/${name}; }) { }
      [

        "niri/config.kdl"

        "noctalia/config.toml"
      ];

  home.packages =
    with pkgs;
    [
      btop
      clang-tools
      cmake
      fastfetch
      fd
      nix-diff
      perf
      python3
      ripgrep
      tmux
      tree
      valgrind
      watch
      zellij
    ]
    ++ [
      inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];

  programs.firefox.enable = true;

  home.stateVersion = "26.05";
}
