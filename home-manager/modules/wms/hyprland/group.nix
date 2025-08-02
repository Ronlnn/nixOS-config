{config, lib, pkgs, ...}:
{
  wayland.windowManager.hyprland.settings.group = {
    auto_group = true;
    insert_after_current = true;
    focus_removed_window = true;
    drag_into_group = 2;
    merge_groups_on_drag = true;
    merge_groups_on_groupbar =  true;
    merge_floated_into_tiled_on_groupbar = true;
    group_on_movetoworkspace = true;

    col.border_active = "0xF5F227";
    col.border_inactive = "0xA1751A";
    col.border_locked_active = "0xA11A74";
    col.border_locked_inactive = "0x4D0635";

    groupbar = {
      enabled = true;
      font_family = "Fira-code";
      font-size = 16;
      font_weight_active = normal;
      font_weight_inactive = normal;
      gradients = false;
      height = 14;
      indicator_gap = 1;
      indicator_height = 3;
      stacked = true;
      render_titles = true;
      priority = 3;
      scrolling = true;
      rounding = 1;
      text_color = "0xBA0202";
      col.active = "0x5EFF8D";
      col.inactive = "0x376B46";
      
    };
  };
}