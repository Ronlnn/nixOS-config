{
    # Enable networking
  networking.networkmanager.enable = true;
  networking.enableIPv6 = true;
  networking.useNetworkd = true;
  boot.kernelModules = ["tun"];
  networking.firewall.allowedUDPPorts = [8443];
  networking.firewall.allowedTCPPorts = [1080 8443];

  security.wrappers.xray = {
    source = "/nix/store/your-xray-path/bin/xray";
    owner = "root";
    group = "root";
    capabilities = "cap_net_admin,cap_net_raw+ep";
  };
}