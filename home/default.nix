{
  pkgs,
  user,
  inputs,
  ...
}:
{
  home = {
    username = user;
    homeDirectory = "/home/${user}";

    stateVersion = "25.11";

    packages =
      with pkgs;
      [
        bat
        bitwarden-desktop
        btop
        bun
        clang
        github-copilot-cli
        gnumake
        eza
        fastfetch
        fd
        firefox
        gh
        lean4
        libinput
        libnotify
        nkf
        pandoc
        pdftk
        python3
        ripgrep
        rofi
        ruff
        texliveFull
        textlint
        tree
        typst
        unzip
        unixtools.arp
        uv
        valgrind
        wl-clipboard
        zathura
        zellij
        zip
      ]
      ++ [
        inputs.zig-overlay.packages.${pkgs.stdenv.hostPlatform.system}.master
      ];
  };

  programs.home-manager = {
    enable = true;
  };

  programs.git = {
    enable = true;
    settings = {
      user.email = "saito.ryuto.ss8@naist.ac.jp";
      user.name = "yruyrui";

      init.defaultBranch = "master";
      trim.bases = "develop,master,main";
      push.autoSetupRemote = true;
      pull.rebase = true;

      url = {
        "ssh://git@github.com/yruyrui" = {
          insteadOf = "https://github.com/yruyrui";
        };
      };
    };
  };

  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    includes = [ "~/.ssh/config.local" ];

    matchBlocks."*" = {
      forwardAgent = false;
      addKeysToAgent = "yes";
      compression = true;
      serverAliveInterval = 0;
      serverAliveCountMax = 3;
      hashKnownHosts = false;
      userKnownHostsFile = "~/.ssh/known_hosts";
    };

    matchBlocks = {
      "github.com" = {
        hostname = "ssh.github.com";
        port = 443;
        user = "git";
        identitiesOnly = true;
      };
    };
  };

  programs.thunderbird = {
    enable = true;
  };
}
