{ pkgs, ... }:
{
  home.packages = with pkgs; [
    discord
    gemini-cli
    obsidian
    slack
    spotify
  ];
}
