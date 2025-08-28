

export PATH="/usr/local/bin:$PATH"
export PATH="$HOME/.npm-global/bin:$PATH"
export NODE_PATH="$HOME/.npm-global/lib/node_modules"


if [[ $- == *i* ]] && command -v fish >/dev/null 2>&1; then # && [[ -z "$IN_NIX_SHELL" ]]; then
    export SHELL=$(command -v fish)
    exec fish
fi


export PS1='\n\[\033[1;36m\]  \w\[\033[0m\]\n\[\033[1;32m\] \[\033[0m\] '
