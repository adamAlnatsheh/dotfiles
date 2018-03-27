export ZSH=/home/aia/.oh-my-zsh

ZSH_THEME="aia1"

DISABLE_AUTO_UPDATE="true"

# ENABLE_CORRECTION="true"
plugins=(tmux, zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"


# ----- my turn... -----

# added by Miniconda3 installer
export PATH="/home/aia/miniconda3/bin:$PATH"

export EDITOR=nvim
bindkey -v
export KEYTIMEOUT=10

# time for my aliases...
alias cl='clear'
alias h='cd $HOME'
alias ga='git add -A'
alias gbl='git blame'
alias gbr='git branch'
alias gc='git commit'
alias gca='git commit -am'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias gm='git merge'
alias gpl='git pull'
alias gr='git rebase'
alias gps='git push'
alias gs='git status'
alias gsa='git stash apply'
alias gst='git stash'
alias gsp='git stash pop'

alias sa='source activate'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
