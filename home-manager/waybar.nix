{config, pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 15;
        spacing = 2;
        reload_style_on_change = true;
        modules-left = ["hyprland/workspaces"];
        "hyprland/workspaces" = {
          active-only = false;
          hide-active = false;
          all-outputs = true;
          on-click = "activate";
          format = "{icon}";
          format-icons = {
            "1" = "1";
            "2" = "2";
            "3" = "3";
            "4" = "4";
            "5" = "5";
            "6" = "6";
            "7" = "7";
            "8" = "8";
            "9" = "9";
            "10" = "0";
          };

        };

      };
    };
    style = ''
      window#waybar {
        background: #11111B;
      }

      #workspaces {
        background: #242438;
        margin: 0 4px;
        padding: 0;
      }
      #workspaces button {
        min-width: 14px;
        min-height: 14px;
        padding: 0;
        margin: 0 3px;
        background-color: #F5C2E7;
        color: #F5C2E7;
        border-radius: 50%;
      }
      #workspaces button.active {
        background-color: #36E0E0;
      }
    '';
  };
}