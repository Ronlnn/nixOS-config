{config, pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;
        modules-left = ["hyprland/workspaces"];
        modules-right = ["backlight"];
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
          format = "{percent}% {icon}";
          format-icons = ["" ""];
        };

      };
    };
    style = ''
      * {
      font-family: "FiraCode Nerd Font", sans-serif;
      }

      window#waybar {
        background: rgba(17, 17, 27, 0.8);
      }

      /* Стили для модуля яркости */
      #backlight {
        padding: 0 10px;
        color: #CDD6F4;
        background: #1E1E2E;
        border-radius: 5px;
      }

      #workspaces {
        background: #242438;
        margin: 4px;
        padding: 2px;
      }

      #workspaces button {
        min-width: 18px;
        min-height: 18px;
        margin: 0;
        padding: 0;
        color: #F38BA8;
      }

      #workspaces button.active {
        border: 1px solid #F38BA8; ;
        border-radius: 50%;
        background: transparent;
        transition: border-color 0.2s ease;
      }

      #workspaces button.urgent {
        color: #F38BA8;
      }

      #workspaces button:hover {
        border: 1px solid #F38BA8; ;
        border-radius: 50%;
      }
    '';
  };
}