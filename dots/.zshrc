# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt autocd
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/banana/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
bindkey "^[[1;3C" forward-word
bindkey "^[[1;3D" backward-word
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
source <(starship init zsh --print-full-init)
export PATH="$PATH:/home/banana/.cargo/bin"
export PATH="$PATH:~/.spoof-dpi/bin"
export PATH="$PATH:~/.config/scripts"
export PATH=$PATH:/home/banana/.spicetify
export PATH="/sbin:$PATH"
export PATH="/opt/rider/bin:$PATH"
eval $(thefuck --alias)
alias ls="eza --icons"
alias cat="bat"
alias v="nvim"
alias vim="nvim"
#export GTK_THEME=Catppuccin-Mocha-Standard-Lavender-Dark:dark
