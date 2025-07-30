{config, lib, pkgs,...}:
{
   config = lib.mkIf config.hyprland.enable {
    services.displayManager.sddm.enable = true;
    services.displayManager.sddm.wayland.enable = true;
   };
}