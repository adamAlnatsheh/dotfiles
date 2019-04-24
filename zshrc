export ZSH=/home/adam/.oh-my-zsh

ZSH_THEME="adam1"
DEFAULT_USER=$USER
DISABLE_AUTO_UPDATE="true"

# ENABLE_CORRECTION="true"
plugins=(tmux, extract)
source $ZSH/oh-my-zsh.sh

export PATH="/home/adam/bin:$PATH"

export PATH="/home/adam/miniconda3/bin:$PATH"

export EDITOR=nvim
bindkey -v
export KEYTIMEOUT=10

alias cl='clear'
alias h='cd $HOME'

alias ga='git add'
alias gbr='git branch'
alias gc='git commit'
alias gca='git commit --amend'
alias gcm='git commit -m'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch --prune'
alias gl='git log'
alias gm='git merge'
alias gpl='git pull --prune'
alias gr='git rebase'
alias gres='git reset'
alias grev='git revert'
alias gps='git push'
alias gs='git status'

alias sa='source activate'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

function up() {
  if [ $# -eq 0 ]
  then
    times=1
  else
    times=$1
  fi
  while [ $times -gt 0 ]; do
    cd ..
    times=$(($times - 1))
  done
}
