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
        "ghostty/config.ghostty"
        "niri/config.kdl"
        "noctalia/config.toml"
      ];

  home.packages =
    with pkgs;
    [
      btop
      clang-tools
      cmake
      cmake-language-server
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
    ++ (with inputs; [
      ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default
      nil.packages.${pkgs.stdenv.hostPlatform.system}.default
    ])
    ++ (with inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
      opencode
      opencode2
      openresearch
    ]);

  programs.firefox = {
    enable = true;
    package = pkgs.firefox-devedition;
    globalExtensions = with pkgs.nur.repos.rycee.firefox-addons; [
      privacy-badger
      {
        package = ublock-origin;
        settings = {
          private_browsing = true;
        };
      }
    ];
  };
  
  home.stateVersion = "26.05";
}
