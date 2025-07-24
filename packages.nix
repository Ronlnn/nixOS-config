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
    ### обои в среде wayland
    #swww

    # GUI utils
    feh
    imv
    dmenu
    ### нотивикатор для wayland
    #mako

    # Xorg stuff
    # терминал для Х11
    #xterm
    # буфер обмена в Х11
    #xclip
    # яркость
    #xorg.xbacklight

    # Wayland stuff
    # Позволяет запускать +-приложения под wayland
    #xwayland
    # Буферв обмена
    #wl-clipboard
    # Менеджер истории буфера обмена
    #cliphist


    # WMs
    #hyprland
    # Демон управления устройствами ввода
    #seatd
    # мост для интеграции Wayland-приложений с Hyprland, например для screencast и screenshot.
    #xdg-desktop-portal-hyprland
    #polybar
    #waybar

    # Звук
    pipewire
    pulseaudio
    pamixer

    # Скриншоты
    flameshot


    # Другое
    ### тема оформления Qt (Kvantum) для улучшенного внешнего вида приложений Qt
    libsForQt5.qtstyleplugin-kvantum
    ### утилита для настройки Qt5 тем и стилей.
    libsForQt5.qt5ct
    pciutils
    home-manager
    gnome-tweaks
  ];

}