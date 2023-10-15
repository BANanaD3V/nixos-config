{ config, pkgs, ... }:
{
    users.users.banana.packages = with pkgs; [
      # instant repl with automatic flake loading
      # repl = pkgs.callPackage ./repl { };

      (pkgs.libsForQt5.callPackage ./xwaylandvideobridge { })

      (pkgs.libsForQt5.callPackage ./flashprint { })

      (pkgs.libsForQt5.callPackage ./sddm-theme { })

      (pkgs.callPackage ./wallpaperengine { })

      (pkgs.callPackage ./star-citizen.nix { })

      # nvchad = pkgs.callPackage ./nvchad { };

      # kodo = pkgs.callPackage ./kodo { };

    ];
}
