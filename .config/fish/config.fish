/opt/homebrew/bin/brew shellenv | source
set -g fish_greeting

if status is-interactive
    starship init fish | source
end

set -x GPG_TTY (tty)

set -x GOPATH (go env GOPATH)
set -x PATH $PATH (go env GOPATH)/bin

# +---------+
# |  Alias  |
# +---------+
alias fuck='thefuck'

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
alias gr='git remote'
alias grs='git remote show'
alias gl='git log --graph --pretty=format:"%C(yellow)%h%Creset ⬢ %C(cyan)%an%Creset ⏱ %Cgreen%ar%Creset%n%Cblue╰─ %s%Creset" --abbrev-commit'

# List Directory
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"

# Terraform
alias tf="terraform"
# Handy change dir shortcuts
abbr .. 'cd ..'
abbr ... 'cd ../..'
abbr .3 'cd ../../..'
abbr .4 'cd ../../../..'
abbr .5 'cd ../../../../..'

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

# Add go path
set -Ux fish_user_paths $fish_user_paths $HOME/go/bin
set -q KREW_ROOT; and set -gx PATH $PATH $KREW_ROOT/.krew/bin; or set -gx PATH $PATH $HOME/.krew/bin


# neofetch
