{ config, lib, pkgs, ... }:

{
  imports = [
    ../wlogout.nix
  ];
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

        # Wlogout
        "$mod, Escape, exec, env XDG_CURRENT_DESKTOP=hyprland wlogout --protocol layer-shell"

        # Worksoaces
        "$mod, left, workspace, -1"
        "$mod, right, workspace, +1"
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"

        # Скриншоты
        "$mod SHIFT, S, exec, grim -g \"$(slurp)\" - | wl-copy"

      ];
      bindm = [
	      "SUPER, mouse:272, movewindow"
	      "SUPER, mouse:273, resizewindow"
	    ];


      monitor = [
        "eDP-1,1920x1080@59.98,0x1080,1"
        "HDMI-A-2,1920x1080@74.97,0x0,1"
      ];

    };

    extraConfig = ''
        # Запускаем скрипт при старте Hyprland
        exec-once = /home/roninn/Scripts/workspaces.sh

        # Базовые настройки workspace (без жесткой привязки)
        workspace = 1, default:true
        workspace = 2
        workspace = 3
        workspace = 4
        workspace = 5
        workspace = 6
        workspace = 7
        workspace = 8
        workspace = 9
        workspace = 10
        cursor {
          no_hardware_cursors = true
        }
        general {
          border_size = 4
          no_border_on_floating = false
          gaps_in = 5
          gaps_out = 15
          gaps_workspaces = 0
          layout = master
          no_focus_fallback = false
          resize_on_border = true
          extend_border_grab_area = 15
          hover_icon_on_border = true
          allow_tearing = false
          resize_corner = 1

          col.active_border = rgba(E85858FF)
          col.inactive_border = rgba(F7F7F7FF)
          col.nogroup_border = rgba(ffffaaFF)
          col.nogroup_border_active = rgba(ffff00FF)

          snap {
            enabled = true
            window_gap = 10
            monitor_gap = 10
            border_overlap = true
          }
        }

      decoration {
        rounding = 15
        active_opacity = 1.0
        inactive_opacity = 1.0
        fullscreen_opacity = 1.0
        dim_inactive = true
        dim_strength = 0.1
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
          noise = 0.00001
          contrast = 1.1
          brightness = 1.1
          vibrancy_darkness = 0.5
          special = true
          popups = true
          input_methods = true
        }
      }

      animations {
        enabled = true
        first_launch_animation = true
        workspace_wraparound = false
        bezier = myBezier, 0.24, 0.97, 0.31, 0.97
        animation = windows, 1, 3, myBezier
        animation = windowsOut, 1, 3, myBezier, popin 80%
        animation = fade, 1, 4, myBezier
        animation = workspaces, 1, 5, myBezier, slide
        animation = layers, 1, 5, myBezier, fade
      }

      input {
        kb_layout = us,ru
        kb_variant = ,
        kb_options = grp:alt_shift_toggle
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
        background_color = rgba(12181FFF)
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
