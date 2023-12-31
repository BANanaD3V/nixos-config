{
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
    substituters = [
      "https://nix-gaming.cachix.org"
      "https://isabelroses.cachix.org"
      "https://nixpkgs-wayland.cachix.org"
    ];
    trusted-public-keys = [
      "nix-gaming.cachix.org-1:nbjlureqMbRAxR1gJ/f3hxemL9svXaZF/Ees8vCUUs4="
      "isabelroses.cachix.org-1:mXdV/CMcPDaiTmkQ7/4+MzChpOe6Cb97njKmBQQmLPM="
      "nixpkgs-wayland.cachix.org-1:3lwxaILxMRkVhehr5StQprHdEo4IrE8sRho9R9HOLYA="
    ];
  };

  # Nixpkgs
  nixpkgs = {
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
}