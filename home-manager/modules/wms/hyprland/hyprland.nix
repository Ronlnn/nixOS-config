{ inputs, config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    fira-code
    jetbrains-mono
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;

    settings = {
      "$mod" = "SUPER";

      bind = [
        "$mod, RETURN, exec, alacritty"
        "$mod, D, exec, kitty"
        "$mod, F, exec, firefox"
      ];

      monitor = [
        "eDP-1,1920x1080@59.98,0x1080,1"
        "HDMI-A-2,1920x1080@74.97,0x0,1"
      ];
    };

    extraConfig = ''
      general {
        border_size = 2
        gaps_in = 5
        gaps_out = 20
        float_gaps = 0
        gaps_workspaces = 0
        col.inactive_border = rgba(914E94FF)
        col.active_border = rgba(DE3AC7FF)
        col.nongroup_border = rgba(163817FF)
        col.nongroup_border_active = rgba(22BD27FF)
        no_focus_fallback = false
        resize_on_border = true
        extend_border_grab_area = 15
        hover_icon_on_border = true
        allow_tearing = false
        resize_corner = 1

        snap {
          enable = true
          window_gap = 10
          monitor_gap = 10
          border_overlap = true
          respect_gaps = true
        }
      }

      decoration {
        rounding = 0
        active_opacity = 1.0
        inactive_opacity = 1.0
        fullscreen_opacity = 1.0
        dim_inactive = true
        dim_strength = 0.2
        dim_special = 0.2
        dim_around = 0.2
        border_part_of_window = true

        blur {
          enabled = true
          size = 8
          passes = 1
          ignore_opacity = true
          new_optimizations = true
          xray = true
          noise = 0.0117
          contrast = 0.8916
          brightness = 0.8172
          vibrancy_darkness = 0.0
          special = false
          popups = false
          input_methods = false
        }

        shadow {
          enable = true
          range = 4
          render_power = 3
          sharp = false
          ignore_window = true
          color = rgba(DB355EFF)
          scale = 1.0
        }
      }

      animations {
        enabled = true
        first_launch_animation = true
        workspace_wraparound = false
        bezier = myBezier, 0.24, 0.97, 0.31, 0.97
        animation = windows, 1, 3, myBezier
        animation = windowsOut, 1, 3, myBezier, popin 80%
        animation = border, 1, 5, myBezier
        animation = fade, 1, 4, myBezier
        animation = workspaces, 1, 5, myBezier, slide left
        animation = layers, 1, 5, myBezier, fade
        animation = zoomFactor, 1, 3, easeOut
      }

      input {
        resolve_binds_by_sym = true
        force_no_accel = false
        follow_mouse = 1
        focus_on_close = 0
        float_switch_override_focus = 0
        sensitivity = 1.0
        touchpad {
          disable_while_typing = true
          natural_scroll = false
          tap-to-click = true
          drag_lock = 2
        }
      }

      gestures {
        workspace_swipe = true
        workspace_swipe_fingers = 2
        workspace_swipe_distance = 200
        workspace_swipe_create_new = true
      }

      group {
        auto_group = true
        insert_after_current = true
        focus_removed_window = true
        drag_into_group = 2
        merge_groups_on_drag = true
        merge_groups_on_groupbar = true
        merge_floated_into_tiled_on_groupbar = true
        group_on_movetoworkspace = true

        col.border_active = rgba(F5F227FF)
        col.border_inactive = rgba(A1751AFF)
        col.border_locked_active = rgba(A11A74FF)
        col.border_locked_inactive = rgba(4D0635FF)

        groupbar {
          enabled = true
          font_family = Fira-code
          font_size = 16
          font_weight_active = normal
          font_weight_inactive = normal
          gradients = false
          height = 14
          indicator_gap = 1
          indicator_height = 3
          stacked = true
          render_titles = true
          priority = 3
          scrolling = true
          rounding = 1
          text_color = rgba(BA0202FF)
          col.active = rgba(5EFF8DFF)
          col.inactive = rgba(376B46FF)
        }
      }

      misc {
        disable_hyprland_logo = true
        disable_splash_rendering = true
        background_color = rgba(571978FF)
        font_family = JetBrainsMono Nerd Font
        vfr = true
        vrr = 1
        render_unfocused_fps = 15
        mouse_move_enables_dpms = false
        always_follow_on_dnd = true
        layers_hog_keyboard_focus = true
      }

      binds {
        pass_mouse_when_bound = false
        scroll_event_delay = 300
        workspace_back_and_forth = false
        allow_workspace_cycles = true
        workspace_center_on = 0
        focus_preferred_method = 0
        window_direction_monitor_fallback = true
        disable_keybind_grabbing = false
      }
    '';
  };
}
