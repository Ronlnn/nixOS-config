{config, lib, pkgs, ...}:
{
  wayland.windowManager.hyprland.settings.gestures = {
    workspace_swipe = true;
    workspace_swipe_fingers = 2;
    workspace_swipe_distance = 200;
    workspace_swipe_create_new = true;
    
  };
}