export PATH=$PATH:$HOME/.local/bin       # ~/.local/bin
export PATH=$PATH:$HOME/opt/node/bin     # nodejs
export PATH=$PATH:$HOME/opt/flutter/bin  # flutter
export PATH=$PATH:$HOME/opt/vscode/bin   # vscode
export PATH=$PATH:$HOME/opt/zig          # vscode


# =========================
# Aliases
# =========================
alias l="ls -l"
alias ll="ls -la"


# =========================
# Prompt function
# =========================
__set_prompt() {
  RESET='\[\e[0m\]'
  PATH_C='\[\033[38;2;142;192;124m\]'
  USER_C='\[\033[38;2;254;128;25m\]'
  HOST_C='\[\033[38;2;78;138;249m\]'
  NIX_C='\[\e[38;5;203m\]'

  if [[ -n "$IN_NIX_SHELL" ]]; then
    local NIX_SHELL_NAME="${IN_NIX_SHELL^}"
    PS1="${USER_C}\u${NIX_C}@${HOST_C}\h${NIX_C}:${PATH_C}\w${RESET}${HOST_C}  $NIX_SHELL_NAME\n${PATH_C}  $(basename "$SHELL") ${NIX_C}→${RESET} "
  else
    PS1=" ${USER_C}\u${NIX_C}@${HOST_C}\h${NIX_C}:${PATH_C}\w${RESET}${HOST_C}\n${PATH_C}  $(basename "$SHELL") ${NIX_C}→${RESET} "
  fi
}

# =========================
# Transient prompt
# =========================
lastcommand() {
  history | tail -1 | cut -c 8-
}

deleteprompt() {
  local n=${PS1@P}
  n=${n//[^$'\n']}
  n=${#n}
  tput cuu $((n + 1))
  tput ed
}

PS0='\[$(deleteprompt)\]\$ $(lastcommand)\n\[${PS1:0:$((EXPS0=1,0))}\]'

__transient_prompt() {
  if [[ "$EXPS0" = 0 ]]; then
    deleteprompt
    echo -e "\033[38;2;78;138;249m~\033[0m"
  else
    EXPS0=0
  fi
}

PROMPT_COMMAND="__set_prompt; __transient_prompt${PROMPT_COMMAND:+; $PROMPT_COMMAND}"
