{ config, default, pkgs, ... }:

{
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza --icons";
      cat = "bat";
      v = "nvim";
      vim = "nvim";
      update = "
      pushd /home/banana/nixos-config/ >/dev/null

      untracked_files=$(git ls-files --exclude-standard --others .)
      if [ -n \"$untracked_files\" ]; then
        git add \"$untracked_files\" >/dev/null
      fi

      sudo nixos-rebuild switch --flake ~/nixos-config --impure
      popd >/dev/null
      ";
    };

    history = {
      path = "${config.xdg.dataHome}/.histfile";
      size = 10000;
      save = 10000;
    };

    initExtra = ''
      # Exports

      export PATH="$PATH:~/.config/scripts"

      # Bind keys & opt

      setopt autocd
      unsetopt beep
      bindkey -e
      bindkey "^[[1;3C" forward-word
      bindkey "^[[1;3D" backward-word
      bindkey "^[[1;5C" forward-word
      bindkey "^[[1;5D" backward-word

      # Eval thefuck
      eval $(thefuck --alias)

      # Source starship
      source <(starship init zsh --print-full-init)
    '';
  };
}
