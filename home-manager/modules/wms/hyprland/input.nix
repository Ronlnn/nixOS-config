{config, lib, pkgs, ...}:
{
  wayland.windowManager.hyprland.settings.input = {
   kb_layout = "us,ru";
   kb_options = "grp:alt_shift_toggle";
   kb_variant = "qwerty";
   resolve_binds_by_sym = true;
   force_no_accel = true;
   follow_mouse = 1;
   focus_on_close = 0;
   float_switch_override_focus = 0;

   touchpad = {
    disable_while_typing = true;
    natural_scroll = false;
    tap-to-click = true;
    drag_lock = 2;
    
   };
  };
}