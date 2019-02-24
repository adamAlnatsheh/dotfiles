function get_pwd(){
  git_root=$PWD
  while [[ $git_root != / && ! -e $git_root/.git ]]; do
    git_root=$git_root:h
  done
  if [[ $git_root = / ]]; then
    unset git_root
    prompt_short_dir=%~
  else
    parent=${git_root%\/*}
    prompt_short_dir=${PWD#$parent/}
  fi
  echo $prompt_short_dir
}

PROMPT='%{$fg[yellow]%}$(get_pwd)%{$reset_color%} \
%{$fg[white]%}$(git_prompt_info)%{$reset_color%} \
%{$fg[green]%}»%{$reset_color%} '


ZSH_THEME_GIT_PROMPT_PREFIX="["
ZSH_THEME_GIT_PROMPT_SUFFIX="]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$FG[214]%}*%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN=""
