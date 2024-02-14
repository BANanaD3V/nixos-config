{
  inputs,
  pkgs,
  username,
  ...
}: let
  update_script = pkgs.writeShellScriptBin "update" ''
    pushd /home/${username}/nixos-config/ >/dev/null

    untracked_files=$(git ls-files --exclude-standard --others .>/dev/null)
    if [ -n \"$untracked_files\" ]; then
      git add \"$untracked_files\" >/dev/null
    fi

    sudo nixos-rebuild switch --flake .
    echo -e "Switched to Generation \033[1m$(sudo nix-env --list-generations --profile /nix/var/nix/profiles/system | grep current | awk '{print $1}')\033[0m"
    popd >/dev/null
  '';
in {
  # Nix
  nix.settings = {
    experimental-features = ["nix-command" "flakes"];
    trusted-substituters = [
      "https://nix-gaming.cachix.org"
      "https://isabelroses.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
      "https://getchoo.cachix.org"
      "https://game-rs.cachix.org"
    ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "isabelroses.cachix.org-1:mXdV/CMcPDaiTmkQ7/4+MzChpOe6Cb97njKmBQQmLPM="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
      "getchoo.cachix.org-1:ftdbAUJVNaFonM0obRGgR5+nUmdLMM+AOvDOSx0z5tE="
      "game-rs.cachix.org-1:fsu+ijfA2GCUE2QX0af80D7x9PCZS79EZbqwtOtlIhA="
    ];
  };

  # Nixpkgs
  nixpkgs = {
    overlays = [
      inputs.neovim-nightly-overlay.overlay
    ];
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "electron-25.9.0"
      ];
    };
  };

  # Scripts
  environment.systemPackages = [
    update_script
  ];
  environment.profiles = [
    "$HOME/.local/share/flatpak/exports/share"
    "/var/lib/flatpak/exports/share"
  ];
}
