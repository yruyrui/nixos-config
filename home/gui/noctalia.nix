{
  pkgs,
  inputs,
  ...
}: {
  imports = [
    inputs.noctalia.homeModules.default
  ];

  programs.noctalia-shell = {
    enable = true;
    settings = {
      # configure noctalia here
      bar = {
        barType = "simple";
        position = "top";
        density = "comfortable";
        fontScale = 1;
        backgroundOpacity = 0.1;
        capsuleOpacity = 1;
        showCapsule = true;
        useSeparateOpacity = true;
        widgets = {
          left = [
            {
              id = "ControlCenter";
              useDistroLogo = true;
            }
            {
              compactMode = false;
              diskPath = "/";
              id = "SystemMonitor";
              showCpuTemp = false;
              showCpuUsage = true;
              showDiskUsage = true;
              showDiskUsageAsPercent = true;
              showLoadAverage = false;
              showMemoryAsPercent = true;
              showMemoryUsage = true;
              showNetworkStats = true;
              useMonospaceFont = true;
            }
            {
              compactMode = false;
              compactShowVisualizer = false;
              id = "MediaMini";
              showAlbumArt = false;
              showArtistFirst = true;
              showProgressRing = true;
              showVisualizer = false;
              visualizerType = "linear";
            }
            {
              displayMode = "alwaysShow";
              id = "Network";
            }
            {
              displayMode = "alwaysShow";
              id = "Bluetooth";
            }
          ];
          center = [
            {
              characterCount = 2;
              colorizeIcons = false;
              emptyColor = "secondary";
              enableScrollWheel = true;
              focusedColor = "primary";
              followFocusedScreen = false;
              groupedBorderOpacity = 1;
              hideUnoccupied = false;
              id = "Workspace";
              labelMode = "none";
              occupiedColor = "secondary";
              showBadge = true;
              showLabelsOnlyWhenOccupied = true;
              unfocusedIconsOpacity = 1;
            }
          ];
          right = [
            {
              id = "NotificationHistory";
            }
            {
              formatHorizontal = "HH:mm ddd, MMM dd";
              formatVertical = "HH mm - dd MM";
              id = "Clock";
              useMonospacedFont = true;
              usePrimaryColor = true;
            }
            {
              displayMode = "alwaysShow";
              id = "Volume";
            }
            {
              displayMode = "alwaysShow";
              id = "Brightness";
            }
            {
              displayMode = "icon-always";
              alwaysShowPercentage = true;
              id = "Battery";
              showPowerProfiles = true;
              warningThreshold = 30;
            }
            {
              id = "SessionMenu";
            }
          ];
        };
      };
      dock = {
        enabled = false;
      };
      colorSchemes.predefinedScheme = "Eldritch";
      #   general = {
      #     avatarImage = "/home/drfoobar/.face";
      #     radiusRatio = 0.2;
      #   };
      location = {
        monthBeforeDay = true;
        name = "Tokyo, Japan";
      };
      controlCenter = {
        cards = [
          {
            enabled = true;
            id = "profile-card";
          }
          {
            enabled = true;
            id = "shortcuts-card";
          }
          {
            enabled = true;
            id = "audio-card";
          }
          {
            enabled = false;
            id = "brightness-card";
          }
          {
            enabled = false;
            id = "weather-card";
          }
          {
            enabled = true;
            id = "media-sysmon-card";
          }
        ];
      };
    };
  };

  home.file.".cache/noctalia/wallpapers.json" = {
    text = builtins.toJSON {
      defaultWallpaper = "~/Images/*";
      wallpapers = {
        "DP-1" = "~/Images/*";
      };
    };
  };
}
