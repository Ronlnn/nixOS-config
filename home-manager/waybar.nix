{config, pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;
        spacing = 2;
        reload_style_on_change = true;
        modules-left = ["hyprland/workspaces"];
        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = true;
          format = "";  # Убираем цифры полностью
          on-click = "activate";
        };
      };
    };
    style = ''
      window#waybar {
        background: #11111B;
        border: none;
      }

      #workspaces {
        background: transparent;
        margin: 0 4px;
        padding: 0;
      }

      #workspaces button {
        min-width: 14px;
        min-height: 14px;
        padding: 0;
        margin: 0 3px;
        border-radius: 50%;
        background-color: #585B70;
      }

      #workspaces button.active {
        background-color: #F5C2E7;
      }

      #workspaces button:hover {
        background-color: #B5B5E6;
      }
    '';
  };
}