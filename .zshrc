export ZSH="$HOME/.oh-my-zsh"
export STARSHIP_CONFIG=~/.config/starship/starship.toml

ZSH_THEME=""

plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

# load colorscript if it exists
source $ZSH/oh-my-zsh.sh

# load plugins
eval "$(zoxide init zsh)"

# load starship
eval "$(starship init zsh)"

# fastfetch. Will be disabled if above colorscript was chosen to install
#fastfetch -c $HOME/.config/fastfetch/config-compact.jsonc

# Set-up icons for files/directories in terminal using lsd
alias cd='z'
alias ls='lsd'
alias l='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lt='ls --tree'
alias tn='tmux new-session'
alias tl='tmux list-sessions'
alias ta='tmux attach-session'
alias lg='lazygit'
alias ld='lazydocker'
alias vim='nvim'

# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)

HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# Flutter SDK
export PATH="/opt/flutter/bin:$PATH"
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH="/home/shade/.local/bin:$PATH"

# bun completions
[ -s "/home/shade/.bun/_bun" ] && source "/home/shade/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

if [ -e /home/shade/.nix-profile/etc/profile.d/nix.sh ]; then . /home/shade/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
