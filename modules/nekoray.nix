{ config, pkgs, lib, ... }:

{
  programs.nekoray = {
    enable = true;
    tunMode.enable = true;
  };

  # Обязательно, если используешь tun
  boot.kernelModules = [ "tun" ];
  networking.networkmanager.enable = true;

  # 🔧 Разрешаем конфликт через mkForce
  security.wrappers.nekobox_core = lib.mkForce {
    owner = "root";
    group = "root";
    source = "${pkgs.nekoray.nekobox-core}/bin/nekobox_core";
    capabilities = "cap_net_admin+ep";
  };
}
