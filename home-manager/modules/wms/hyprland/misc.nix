{config, lib, pkgs, ...}:
{
  fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
  ];

  wayland.windowManager.hyprland.settings.misc = {
  disabel_hyprland_logo = true;
  disable_splash_rendering = true;
  background_color = "0x571978";
  font_family = "JetBrainsMono Nerd Font";
  vfr = true;
  vrr = 3;
  render_unfocused_fps = 15;
  mouse_move_enables_dpms = true;
  always_follow_on_dnd = true;
  layers_hog_keyboard_focus = true;
  

  };
}