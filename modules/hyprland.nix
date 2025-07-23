{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    nvidiaPatches = true;
    xwayland.enable = true;
  };
  environment.sessionVariables = {
    WLR_NO_HARDWARE_CURSORS = "1";
    NIXON_OZONE_WL = "1";
  };
  hardware = {
    opengl.enable = true;
    nvidia.modesetting.enable = true;
  };
  envirenment.systemPackages = [
    (pkgs.waybar.overrideAttrs (ildAttrs:{
      mesonFlags = oldAttrs.mesonFlags ++ ["-Dexperimental=true"];
    })
    )
  ];
  xdg.portal.enable = true;
  xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
}
