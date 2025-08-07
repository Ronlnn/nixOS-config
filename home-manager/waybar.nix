{config, pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        modules-left = ["hyprland/workspaces"];
        modules-right = ["backlight" "battery"];
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "󰪥"; "2" = "󰪥"; "3" = "󰪥"; "4" = "󰪥"; "5" = "󰪥";
            "6" = "󰪥"; "7" = "󰪥"; "8" = "󰪥"; "9" = "󰪥"; "10" = "󰪥";
          };
          on-click = "activate";
        };
        "backlight" = {
          device = "intel_backlight";
          scroll-step = 10.0;
          format = "{icon} {percent}%";
          format-icons = ["󱩎" "󱩒" "󱩔" "󱩖"];
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "<span background='#7BD62B' foreground='#1E1E2E'> {icon} </span> <span foreground='#7BD62B'>{capacity}%</span>";
          format-charging = "<span background='#7BD62B' foreground='#1E1E2E'> {icon} </span> <span foreground='#7BD62B'>{capacity}%</span>";
          format-warning = "<span background='#FFD700' foreground='#1E1E2E'> {icon} </span> <span foreground='#FFD700'>{capacity}%</span>";
          format-critical = "<span background='#FF5555' foreground='#1E1E2E'> {icon} </span> <span foreground='#FF5555'>{capacity}%</span>";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰂀" "󰂂"];
          interval = 10;
          max-length = 20;
        };


      };
    };
    style = ''
      * {
      font-family: "FiraCode Nerd Font", sans-serif;
      font-size: 14px;
      }
      window#waybar {
        background: rgba(17, 17, 27, 0.5);
        padding: 4px;
      }

      /* Яркость */
      #backlight {
        min-width: 56px;
        min-height: 24px;
        padding: 0 12px;
        color: #F5DE7A;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
      }
      /* Общий стиль блока батареи */
      #battery {
        padding: 0 12px;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
        min-width: 60px;
        min-height: 24px;
      }

      /* Workspaces */
      #workspaces {
        background: #242438;
        border-radius: 20px;
        margin: 4px;
        padding: 2px;
      }
      #workspaces button {
        min-width: 24px;
        min-height: 24px;
        margin: 0;
        padding: 0;
        color: #F38BA8;
      }
      #workspaces button.active {
        border-bottom: 2px solid #F38BA8;
        border-radius: 0 0 10px 10px;
        background: transparent;
        transition: border-color 0.2s ease;
      }
      #workspaces button.urgent {
        color: #F38BA8;
      }
      #workspaces button.empty {
        color: #CDD6F4;
      }
      #workspaces button:hover {
        color: #F38BA8;
        background: transparent;
        border-bottom: 2px solid #F38BA8;

      }
    '';
  };
}