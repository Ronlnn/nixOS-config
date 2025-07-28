{pkgs, ...}: {
  nixpkgs.config ={
    allowUnfree = true;
  };

   environment.systemPackages = with pkgs; [
    # Desktop apps
    pkgs.telegram-desktop
    pkgs.alacritty
    pkgs.obsidian
    pkgs.firefox
    pkgs.spotify

    # Coding stuff
    pkgs.vscode
    pkgs.nodejs
    pkgs.flatpak

    # VPN
    pkgs.hiddify-app
    pkgs.xray
    pkgs.v2ray
    pkgs.sing-box
    pkgs.v2rayn

    #CLI utils
    ## Системные
    pkgs.neofetch
    pkgs.fastfetch
    pkgs.tree
    pkgs.htop
    pkgs.btop
    pkgs.nix-index
    pkgs.unzip
    pkgs.zip
    pkgs.openssl
    pkgs.lazygit
    pkgs.micro

    # appimage-run
    pkgs.appimage-run
    pkgs.libepoxy
    pkgs.libpng
    pkgs.fuse
    pkgs.fuse2
    pkgs.zlib
    pkgs.glib

    ## Мультимедиа и звук
    pkgs.ffmpeg
    pkgs.cava

    ## Яркость
    pkgs.light
    pkgs.lux
    pkgs.brightnessctl

    ## Сетевые и файловые
    pkgs.wget
    pkgs.bluez
    pkgs.bluez-tools

    ## Файловые менеджеры и оформление
    pkgs.ranger
    ### обои в среде wayland
    #swww

    # GUI utils
    pkgs.feh
    pkgs.imv
    pkgs.dmenu
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
    pkgs.pipewire
    pkgs.pulseaudio
    pkgs.pamixer

    # Скриншоты
    pkgs.flameshot


    # Другое
    ### тема оформления Qt (Kvantum) для улучшенного внешнего вида приложений Qt
    pkgs.libsForQt5.qtstyleplugin-kvantum
    ### утилита для настройки Qt5 тем и стилей.
    pkgs.libsForQt5.qt5ct
    pkgs.pciutils
    pkgs.home-manager
    pkgs.gnome-tweaks
  ];

}