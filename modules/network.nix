{config, pkgs, ...}:
{
    # Enable networking
  networking.networkmanager.enable = true;
  networking.enableIPv6 = true;
  networking.useNetworkd = false;
  boot.kernelModules = ["tun" "fuse"];
  networking.useDHCP = true;
  #networking.firewall.allowedUDPPorts = [8443];
  #networking.firewall.allowedTCPPorts = [1080 8443];
  networking.firewall.enable = false;

  security.wrappers.xray = {
  source = "${pkgs.xray}/bin/xray";
  owner = "root";
  group = "root";
  capabilities = "cap_net_admin,cap_net_raw+ep";


  # Переменные окружения для AppImage (чтобы видел нужные библиотеки)
  environment.sessionVariables = {
    LD_LIBRARY_PATH = lib.makeLibraryPath appDeps;
  };

  # Включаем systemd-модуль user-tun (если используешь tun для VPN)
  systemd.services.nekoray = {
    description = "Nekoray VPN service";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.nekoray}/bin/nekoray"; # или путь к твоему AppImage с appimage-run, если нужен
      Restart = "on-failure";
      CapabilityBoundingSet = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE";
      AmbientCapabilities = "CAP_NET_ADMIN CAP_NET_BIND_SERVICE";
    };
  };
    programs.nekoray = {
    enable = true;
    tunMode.enable = true;
  };
  services.sing-box.enable = true;
};

}