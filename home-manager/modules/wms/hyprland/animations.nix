{config, lib, pkgs, ...}:
{
  wayland.windowManager.hyprland.settings.animations = ''
    enabled = true;
    first-launch-animation = true;
    workspace_wraparound = false;
    bezier = myBezier, 0.24, 0.97, 0.31, 0.97
    animation = windows, 1, 3, myBezier
    animation = windowsOut, 1, 3, myBezier, popin 80%
    animation = border, 1, 5, myBezier
    animation = fade, 1, 4, myBezier
    animation = workspaces, 1, 5, myBezier, slide left
    animation = layers, 1, 5, myBezier, fade
    animation = zoomFactor, 1, 3, easeOut

  '';
}