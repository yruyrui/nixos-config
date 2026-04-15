{pkgs, ...}: {
  home.packages = with pkgs; [
    discord
    obsidian
    slack
    spotify
  ];
}
