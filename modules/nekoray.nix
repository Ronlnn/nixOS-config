{ config, pkgs, lib, ... }:

{
  services.sing-box.enable = true;
  enable_dns_server
  programs.nekoray = {
    enable = true;
    tunMode.enable = true;
  };
  me

networking.firewall.enable = true;
networking.firewall.allowedUDPPorts = [53];
networking.firewall.allowedTCPPorts = [  22
  80
];
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
