{pkgs, ...}: {
  nixpkgs.config ={
    allowUnfree = true;
  };
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;

  services.dbus.packages = [ pkgs.bluez ];

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
    bluez-alsa
    blueman
    pkgs.networkmanager_dmenu
    networkmanager
    ## Файловые менеджеры и оформление
    ranger


    # GUI utils
    feh
    imv
    #dmenu

    # ZSH
    zsh

    # Звук
    pipewire
    pulseaudio
    pamixer
    pavucontrol
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
    catppuccin-grub
    grub2
    wpa_supplicant
    base16-schemes
  ];
  fonts.packages = with pkgs; [
    font-awesome
    fira
    nerd-fonts.fira-code
    nerd-fonts.jetbrains-mono
];

}
