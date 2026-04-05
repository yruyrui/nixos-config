{
  pkgs,
  config,
  lib,
  inputs,
  ...
}:
with lib; let
  cfg = config.modules.gui.niri;
in {
  options.modules.gui = {
    niri = {
      enable = mkEnableOption "Niri-based desktop environment";
    };
  };
  config = mkIf cfg.enable {
    programs.niri.enable = true;

    qt = {
      enable = true;
    };

    environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
      xwayland-satellite
      alacritty
      fuzzel
    ];

    # services.greetd = {
    #   enable = true;
    #   settings = {
    #     default_session = {
    #       command = "${pkgs.tuigreet}/bin/tuigreet --cmd niri-session";
    #       user = "greeter";
    #     };

    #     initial_session = {
    #       command = "niri-session";
    #       user = "faireborn";
    #     };
    #   };
    # };
  };
}
