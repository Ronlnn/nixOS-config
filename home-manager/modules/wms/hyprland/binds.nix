{config, lib, pkgs, ...}:
{
wayland.windowManager.hyprland.settings.binds = {
  pass_mouse_when_bound = false;
  scroll_event_delay = 300;
  # Workspaces
  workspace_back_and_forth = false;
  allow_workspace_cycles = true;
  workspace_center_on = 0;
  # Focus & Move windows
  focus_preferred_method = 0;
  window_direction_monitor_fallback = true;
  disable_keybind_grabbing = false;
  
};
}