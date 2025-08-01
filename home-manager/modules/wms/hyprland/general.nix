{config, lib, pkgs, ...}:
{
  wayland.windowManager.hyprland.settings.general = {
          border_size = 2;
          gaps_in = 5;
          gaps_out = 20;
          float_gaps = 0;
          gaps_workspaces = 0;
          col.inactive_border = "0xA19D9CFF";
          col.active_border = "0x#A61EB3FF";
          col.nongroup_border = "0x163817FF";
          col.nongroup_border_active = "0x#22BD27FF";
          no_focus_fallback = false;
          resize_on_border = true;
          extend_border_grab_area = 15;
          hover_icon_on_border = true;
          allow_tearing = false;
          resize_corner = 1;

          snap = {
            enable = true;
            window_gap = 10;
            monitor_gap = 10;
            border_overlap = true;
            respect_gaps = true;
          };
        };
}