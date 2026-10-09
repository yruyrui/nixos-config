{lib, ...}:

{
  nixpkgs.overlays = [
        (lib.mkAfter (
          final: prev: {
            uboot-asahi = prev.uboot-asahi.overrideAttrs (oldAttrs: {
              makeFlags = [ "DTC=${lib.getExe final.buildPackages.dtc}" ] ++ oldAttrs.makeFlags;
            });
          }
        ))
      ];
}

