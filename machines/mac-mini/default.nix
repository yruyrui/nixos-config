{ ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./apple-silicon-support
    ./patch.nix
  ];
}
