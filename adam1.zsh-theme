function echo_git_dir(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=""
  else
    parent=${git_root%\/*}
    prompt_short_dir=/${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

function echo_root() {
    wd=$PWD
    curr_dir=$wd
    while [[ $curr_dir != "/" ]]; do
        if [[ -e $curr_dir/.git ]]; then
            curr_dir=$curr_dir:h
            break
        else
            curr_dir=$curr_dir:h
        fi
    done
    if [[ "$curr_dir" = "/" ]]; then
        echo $(print -D $wd)
    else
        echo $(print -D $curr_dir)
    fi
    cd $wd
}


PROMPT='%{$fg[white]%}$(echo_root)%{$reset_color%}\
%{$fg[yellow]%}$(echo_git_dir)%{$reset_color%} \
%{$fg[white]%}$(git_prompt_info)%{$reset_color%} \
%{$fg[white]%}»%{$reset_color%} '


ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
