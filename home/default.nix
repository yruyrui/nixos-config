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

    packages = [
      pkgs.bat
      pkgs.btop
      pkgs.bun
      pkgs.clang
      pkgs.github-copilot-cli
      pkgs.eza
      pkgs.fastfetch
      pkgs.fd
      pkgs.firefox
      pkgs.gh
      pkgs.lean4
      pkgs.libnotify
      pkgs.pdftk
      pkgs.python3
      pkgs.ripgrep
      pkgs.rofi
      pkgs.texliveFull
      pkgs.textlint
      pkgs.typst
      pkgs.unzip
      pkgs.unixtools.arp
      pkgs.valgrind
      pkgs.wl-clipboard
      pkgs.zellij
      inputs.zig-overlay.packages.${pkgs.stdenv.hostPlatform.system}.master
    ];
  };

  programs.home-manager.enable = true;

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

    matchBlocks = {
      "pine??" = {
        user = "ryuto-sa";
        forwardAgent = true;
        setEnv = {
          TERM = "xterm-256color";
        };
      };
    };
  };

  programs.thunderbird = {
    enable = true;
  };
}
