{
  pkgs,
  inputs,
  ...
}:
{
  imports = [
    inputs.hyprland.homeManagerModules.default
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    gtk4.theme = null;

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      "$mod" = "SUPER";
      "$ipc" = "noctalia-shell ipc call";

      "$menu" = "";
      "$terminal" = "ghostty";

      monitor = ",preferred,auto,1";
      exec-once = [
        # "caelestia shell -d"
        "noctalia-shell"
        "fcitx5-remote -r"
        "fcitx5 -d --replace &"
        "fcitx5-remote -r"
        "$terminal"
      ];

      general = {
        gaps_in = 4;
        gaps_out = 4;
      };

      decoration = {
        rounding = 16;
        rounding_power = 2;

        # Transparency
        active_opacity = 1.0;
        inactive_opacity = 0.9;
      };

      animations = {
        enabled = true;
        bezier = [
          # NAME,          X0,   Y0,   X1,   Y1
          "easeOutQuint,   0.23, 1,    0.32, 1"
          "easeInOutCubic, 0.65, 0.05, 0.36, 1"
          "linear,         0,    0,    1,    1"
          "almostLinear,   0.5,  0.5,  0.75, 1"
          "swift,          0.55, 0,    0.1,  1"
          "quick,          0.15, 0,    0.1,  1"
        ];
        animation = [
          #  NAME,        ONOFF, SPEED, CURVE,        [STYLE]
          "global,        1,     10,    default"
          "border,        1,     5.39,  easeOutQuint"
          "windows,       1,     4.79,  easeOutQuint"
          "windowsIn,     1,     4.1,   easeOutQuint, popin 87%"
          "windowsOut,    1,     1.49,  linear,       popin 87%"
          "fadeIn,        1,     1.73,  almostLinear"
          "fadeOut,       1,     1.46,  almostLinear"
          "fade,          1,     3.03,  quick"
          "layers,        1,     3.81,  easeOutQuint"
          "layersIn,      1,     4,     easeOutQuint, fade"
          "layersOut,     1,     1.5,   linear,       fade"
          "fadeLayersIn,  1,     1.79,  almostLinear"
          "fadeLayersOut, 1,     1.39,  almostLinear"
          "workspaces,    1,     4,     easeOutQuint"
          "workspacesIn,  1,     4,     easeOutQuint"
          "workspacesOut, 1,     4,     easeOutQuint"
          "zoomFactor,    1,     7,     quick"
        ];
      };

      input = {
        repeat_rate = 64;
        repeat_delay = 256;
        touchpad = {
          natural_scroll = true;
        };
        kb_options = "ctrl:nocaps";
      };

      bind = [
        "$mod, F, exec, firefox"
        "$mod, T, exec, $terminal"
        "$mod, Q, killactive,"
        "$mod, M, exec, command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch exit"
        ", Print, exec, grimblast copy area"

        "$mod, H, movefocus, l"
        "$mod, L, movefocus, r"
        "$mod, K, movefocus, u"
        "$mod, J, movefocus, d"
        "$mod SHIFT, H, swapwindow, l"
        "$mod SHIFT, L, swapwindow, r"
        "$mod SHIFT, K, swapwindow, u"
        "$mod SHIFT, J, swapwindow, d"
        "$mod, SPACE, exec, $ipc launcher toggle"
      ]
      ++ (
        # workspaces
        # binds $mod + [shift +] {1..9} to [move to] workspace {1..9}
        builtins.concatLists (
          builtins.genList (
            i:
            let
              ws = i + 1;
            in
            [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          ) 9
        )
      );
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      bindel = [
        ", XF86AudioRaiseVolume, exec, $ipc volume increase"
        ", XF86AudioLowerVolume, exec, $ipc volume decrease"
        ", XF86MonBrightnessUp, exec, $ipc brightness increase"
        ", XF86MonBrightnessDown, exec, $ipc brightness decrease"
      ];
      bindl = [
        ", XF86AudioMute, exec, $ipc volume muteOutput"
      ];
    };
  };
}
