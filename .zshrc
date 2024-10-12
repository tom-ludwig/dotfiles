# zsh-syntax-highlighting: https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# zsh-autosuggestions: https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
    # Define an array of themes
    # 1: WIP; 2: Minimal; 3: Full
    themes=("zen.toml" "amro.cmp.json" "catppuccin.omp.json")

    # IMPORTANT: ZSH first index is 1 not 0!
    default_theme="${themes[1]}"

    # Set the path to the selected theme
    theme_path="$HOME/.config/ohmyposh/$default_theme"

    # Initialize Oh My Posh with the selected theme
    eval "$(oh-my-posh init zsh --config $theme_path)"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
#
export PATH="$PATH:$HOME/.rvm/bin"

# ---- The Fuck ----
# thefuck alias
eval $(thefuck --alias)

# Eza (a better ls)
alias ls="eza --icons=always"

export PATH="$PATH:/Users/tommyludwig/.local/bin" # Added by Docker Labs Debug Tools"

# Export preferred editor
export EDITOR=nvim

source <(fzf --zsh)

alias cat=bat

# ---- GIT ----
alias gs='git status'
alias ga='git add'
alias gp='git push'
alias gpo='git push origin'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias gr='git branch -r'
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gco='git checkout '
alias gl='git log'
alias gr='git remote'
alias grs='git remote show'
alias glo='git log --pretty="oneline"'
alias glol='git log --graph --oneline --decorate'

# +---------+
# | ALIASES |
# +---------+

alias cloc=loc
#source $HOME/aliases/aliases

neofetch
