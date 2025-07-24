{ pkgs, ... }:

{
  programs.nekoray = {
    enable = true;
    tunMode.enable = true;
  };
  boot.kernelModules = [ "tun" ];
    networking.networkmanager.enable = true;

  security.wrappers.nekobox_core = {
  owner = "root";
  group = "root";
  source = "${pkgs.nekoray.nekobox-core}/bin/nekobox_core";
  capabilities = "cap_net_admin+ep";
};

}
