{
  lib,
  pkgs,
  inputs,
  ...
}: let
  inherit (builtins) readDir;
  inherit (lib.attrsets) foldlAttrs;
  inherit (lib.lists) optional;
  by-name = ./plugins;
in {
  imports =
    (foldlAttrs (
      prev: name: type:
        prev ++ optional (type == "regular") (by-name + "/${name}")
    ) [] (readDir by-name))
    ++ [
      # ./autocommands.nix
      ./keys.nix
      # ./options.nix
      ./settings.nix
      # ./highlight.nix
      inputs.nixvim.homeModules.nixvim
    ];

  programs.nixvim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.stdenv.hostPlatform.system}.default;
  };
}
