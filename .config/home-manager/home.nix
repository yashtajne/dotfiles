

{ config, pkgs, ... }: {
  home.username = "yash";
  home.homeDirectory = "/home/yash";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [

    # Shells
    fish

    # Fonts
    cascadia-code
    nerd-fonts.jetbrains-mono
    nerd-fonts.gohufont

    # Apps
    lxappearance
    libreoffice
    librewolf
    notepad-next
    xfce.thunar
    vscodium
    rofi
    vlc
    mpv
    contour
    alacritty
    pavucontrol
    polybar
    qbittorrent
    stm32cubemx

    # CLIs
    neovim
    feh
    git
    git-credential-manager
    zip
    unzip
    rar
    curl
    wget
    file
    tree
    tmux
    zellij
    iw
    killall
    acpi
    wirelesstools
    xdotool
    maim
    pciutils
    htop
    btop
    xclip
    alsa-utils
    bluetuith
    yt-dlp

    # Other
    mysql80
    gcc
    lua
    luajitPackages.luarocks
    jdk8
    nodejs_20
    jupyter-all # Installs python
    texliveFull

    # libs
    xfce.thunar
    xfce.tumbler
    ffmpegthumbnailer
    gdk-pixbuf
    libheif
    libopenraw
    poppler
    bluez-alsa
  ];
}

