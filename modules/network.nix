{config, pkgs, ...}:
{
    # Enable networking
  networking.networkmanager.enable = true;
  networking.enableIPv6 = true;
  networking.useNetworkd = false;
  boot.kernelModules = ["tun"];
  networking.firewall.allowedUDPPorts = [8443];
  networking.firewall.allowedTCPPorts = [1080 8443];

  security.wrappers.xray = {
  source = "${pkgs.xray}/bin/xray";
  owner = "root";
  group = "root";
  capabilities = "cap_net_admin,cap_net_raw+ep";

};




}