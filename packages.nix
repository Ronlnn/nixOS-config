{pkgs, ...}: {
  nixpkgs.config ={
    allowUnfree = true;
  };

   environment.systemPackages = with pkgs; [
    # Desktop apps

    telegram-desktop
    alacritty
    obsidian
    firefox
    spotify
    onlyoffice-desktopeditors
    kdePackages.okular
    anydesk

    # Coding stuff
    vscode
    nodejs
    flatpak

    # VPN
    hiddify-app
    xray
    v2ray
    sing-box
    v2rayn

    #CLI utils
    ## Системные
    neofetch
    fastfetch
    tree
    htop
    btop
    nix-index
    unzip
    zip
    openssl
    lazygit
    micro

    # appimage-run
    appimage-run
    libepoxy
    libpng
    fuse
    fuse2
    zlib
    glib

    ## Мультимедиа и звук
    ffmpeg
    cava

    ## Яркость
    light
    lux
    brightnessctl

    ## Сетевые и файловые
    wget
    bluez
    bluez-tools

    ## Файловые менеджеры и оформление
    ranger


    # GUI utils
    feh
    imv
    #dmenu

    # Xorg stuff
    # терминал для Х11
    #xterm
    # буфер обмена в Х11
    #xclip
    # яркость
    #xorg.xbacklight

    # Звук
    pipewire
    pulseaudio
    pamixer

    # Скриншоты
    flameshot

    # Fonts
    font-awesome
    fira

    # Другое
    ### тема оформления Qt (Kvantum) для улучшенного внешнего вида приложений Qt
    libsForQt5.qtstyleplugin-kvantum
    ### утилита для настройки Qt5 тем и стилей.
    libsForQt5.qt5ct
    pciutils
    home-manager
    gnome-tweaks
    catppuccin-grub
    grub2
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
  ];
  fonts.fonts = with pkgs; [
    font-awesome
    fira
];

}
