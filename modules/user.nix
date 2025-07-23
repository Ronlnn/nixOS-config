{pkgs, ...}: {

  users  = {
  
   users.roninn = {
    isNormalUser = true;
    description = "RonInn";
    extraGroups = [ "networkmanager" "wheel" "video" "audio" "input" ];
    packages = with pkgs; [];
  };
 };
 service.getty.autologinUser = "roninn";
}
