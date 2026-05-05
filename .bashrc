export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/drive/AppData/bin
export PATH=$PATH:/drive/AppData/.cargo/bin
export PATH=$PATH:/drive/AppData/.java/bin
export PATH=$PATH:/drive/AppData/.bun/bin
export PATH=$PATH:/drive/AppData/.net

export DOTNET_ROOT=/drive/AppData/.net
export NVM_DIR="/drive/AppData/.nodejs"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
export RUSTUP_HOME=/drive/AppData/.rustup
export CARGO_HOME=/drive/AppData/.cargo
export JAVA_HOME=/drive/AppData/.java
export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=01;30;42:ow=01;30;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;90:*~=00;90:*#=00;90:*.bak=00;90:*.crdownload=00;90:*.dpkg-dist=00;90:*.dpkg-new=00;90:*.dpkg-old=00;90:*.dpkg-tmp=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:*.swp=00;90:*.tmp=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:'

# =========================
# Aliases
# =========================

alias cls="clear"
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias la="ls -la --color=auto"
alias tr="tree"

alias nf="neofetch"
alias gs="git status"

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
    PS1="${USER_C}\u${NIX_C}@${HOST_C}\h${NIX_C}:${PATH_C}\w${RESET}${HOST_C}  $NIX_SHELL_NAME\n${PATH_C}  $(basename "$SHELL") ${NIX_C}→ ${RESET} "
  else
    PS1=" ${USER_C}\u${NIX_C}@${HOST_C}\h${NIX_C}:${PATH_C}\w${RESET}${HOST_C}\n${PATH_C}  $(basename "$SHELL") ${NIX_C}→ ${RESET} "
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
. "/drive/AppData/.cargo/env"

export NVM_DIR="/drive/AppData/.nodejs"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
