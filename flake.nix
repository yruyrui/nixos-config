{
  description = "NixOS systems and tools by yruyrui";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    caelestia-shell = {
      url = "github:caelestia-dots/shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.noctalia-qs.follows = "noctalia-qs";
    };

    noctalia-qs = {
      url = "github:noctalia-dev/noctalia-qs";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
    };

    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    zig-overlay = {
      url = "github:mitchellh/zig-overlay";
    };

    zls = {
      url = "github:zigtools/zls";
    };

    ghostty = {
      url = "github:ghostty-org/ghostty/tip"; # Latest Continuous Release
    };

    hyprland = {
      url = "github:hyprwm/Hyprland";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    ...
  } @ inputs: {
    nixosConfigurations = {
      thinkpad = let
        system = "x86_64-linux";
        user = "yruyrui";
        specialArgs = {inherit user system inputs;};
      in
        nixpkgs.lib.nixosSystem {
          inherit system specialArgs;
          modules = [
            ./machines/thinkpad.nix
            ./users/${user}/nixos.nix
            ./modules/gui/niri.nix

            {
              modules.gui.niri.enable = true;
            }

            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = inputs // specialArgs;
              home-manager.users.${user} = import ./users/${user}/home.nix;
            }
          ];
        };
    };
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.alejandra;
  };
}
