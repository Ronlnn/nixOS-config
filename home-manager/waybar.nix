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
        modules-right = ["backlight" "battery" "bluetooth"];
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
          format = "<big>{icon}</big> {percent}%";
          format-icons = ["<big>󱩎</big>" "<big>󱩒</big>" "<big>󱩔</big>" "<big>󱩖</big>"];
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "<big>{icon}</big> {capacity}%";
          format-charging = "<big>󰂄 </big> {capacity}%";
          format-warning = "󰂃 {capacity}%";
          format-critical = "󱧥 {capacity}%";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰂀" "󰂂" ];
          interval = 10;
          max-length = 20;
        };
        "bluetooth" = {
          format = "<big>󰂯</big> {status}";
          format-connected = "<big>󰂯</big> {device_alias}";
          format-connected-battery = "<big>󰂯</big> {device_alias} {device_battery_percentage}%";
          tooltip-format = "{controller_alias}\t{controller_address}\n\n{num_connections} connected";
          tooltip-format-connected = "{controller_alias}\t{controller_address}\n\n{num_connections} connected\n\n{device_enumerate}";
          tooltip-format-enumerate-connected = "{device_alias}\t{device_address}";
          tooltip-format-enumerate-connected-battery = "{device_alias}\t{device_address}\t{device_battery_percentage}%";

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
        min-width: 46px;
        padding: 0 12px;
        color: #FAF839;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
      }
      /* Батарея */
      #battery {
        min-width: 46px;
        padding: 0 12px;
        color: #7BD62B;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
      }
      #battery.charging {
        color: #7BD62B;
      }
      #battery.warning {
        color: #7BD62B;
      }
      /* Батарея */
      #bluetooth {
        min-width: 46px;
        padding: 0 12px;
        color: #88DAEA;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;

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