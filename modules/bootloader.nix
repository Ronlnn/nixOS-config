{
   # Bootloader.
  #boot.loader.systemd-boot.enable = true;
  #boot.loader.efi.canTouchEfiVariables = true;
  #boot.loader.timeout = 3;
  boot.loader.limine = {
  enable = true;
  configurationLimit = 5;
  style = {
    enable = true;
    resolution = "1920x1080";
    wallpapers = [
      ../walls/zenitsu.png
    ];
  };
};

}
