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
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = ""; "2" = ""; "3" = ""; "4" = ""; "5" = "";
            "6" = ""; "7" = ""; "8" = ""; "9" = ""; "10" = "";
          };
          on-click = "activate";
        };
      };
    };
    style = ''
      window#waybar {
        background: rgba(17, 17, 27, 0.8);
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