{pkgs, ...}: {
  imports = [
    ../../home
    ../../home/editor
    ../../home/gui
    ../../home/ime
    ../../home/terminal
    ../../home/unfree.nix
  ];
}
