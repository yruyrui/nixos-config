{
  pkgs,
  inputs,
  ...
}: {
  programs.ghostty = {
    enable = true;
    package = inputs.ghostty.packages.${pkgs.stdenv.hostPlatform.system}.default;

    settings = {
      font-family = "FiraCode Nerd Font";
      font-size = 12;

      theme = "Solarized Osaka Night";

      window-decoration = "none";
      window-padding-balance = true;

      confirm-close-surface = false;
    };
  };
}
