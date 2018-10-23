#
# /etc/bash.bashrc
#
# --- [bashful] - [nick strauser]; 2018 ---

# If not running interactively, don't do anything
[[ $- != *i* ]] && returnn

[[ $DISPLAY ]] && shopt -s checkwinsize

PS1='\[\033[1;31m\] [\[\033[1;36m\]\u\[\033[1;31m\]] [\[\033[1;32m\]\W\[\033[1;31m\]]\[\033[33m\]\$ \[\033[37m\]'

case ${TERM} in
  xterm*|rxvt*|Eterm|aterm|kterm|gnome*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033]0;%s@%s:%s\007" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'

    ;;
  screen*)
    PROMPT_COMMAND=${PROMPT_COMMAND:+$PROMPT_COMMAND; }'printf "\033_%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/\~}"'
    ;;
esac

[ -r /usr/share/bash-completion/bash_completion   ] && . /usr/share/bash-completion/bash_completion
