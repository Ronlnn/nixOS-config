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
        modules-right = ["backlight/slider"];
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = ""; "2" = ""; "3" = ""; "4" = ""; "5" = "";
            "6" = ""; "7" = ""; "8" = ""; "9" = ""; "10" = "";
          };
          on-click = "activate";
        };
        "backlight/slider" = {
          min = 0;
          max = 100;
          orientation = "horizontal";
        };

      };
    };
    style = ''
      window#waybar {
        background: rgba(17, 17, 27, 0.8);
      }

      #backlight/slider slider {
        min-height: 0px;
        min-width: 0px;
        opacity: 0;
        background-image: none;
        border: none;
        box-shadow: none;
      }
      #backlight-slider trough {
        min-height: 80px;
        min-width: 10px;
        border-radius: 5px;
        background-color: black;
      }
      #backlight-slider highlight {
        min-width: 10px;
        border-radius: 5px;
        background-color: red;
      }

      #workspaces {
        background: transparent;
        margin: 0 4px;
      }

      #workspaces button {
        min-width: 16px;
        min-height: 16px;
        margin: 4px 3px;
        padding: 0;
        border-radius: 50%;
        background: #585B70;
      }

      #workspaces button.active {
        background: #F5C2E7;
      }

      #workspaces button.urgent {
        background: #F38BA8;
      }

      #workspaces button:hover {
        background: #B5B5E6;
      }
    '';
  };
}