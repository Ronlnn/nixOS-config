{config, pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 24;  # Оптимальная высота для кружков
        spacing = 2;
        reload_style_on_change = true;
        modules-left = ["hyprland/workspaces"];
        "hyprland/workspaces" = {
          active-only = false;
          all-outputs = true;
          format = "";  # Пустая строка вместо цифр
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
        min-width: 12px;
        min-height: 12px;
        padding: 0;
        margin: 0 3px;
        border-radius: 50%;
        background-color: #585B70;  # Неактивный workspace
        transition: background-color 0.3s;
      }

      #workspaces button.active {
        background-color: #F5C2E7;  # Активный workspace
      }

      #workspaces button:hover {
        background-color: #B5B5E6;  # При наведении
      }
    '';
  };
}