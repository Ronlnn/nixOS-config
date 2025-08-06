{config, pkgs, ...}:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
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
        border: 1px solid #11111B;
        border-radius: 5px;

      }

      #workspaces {
        background: #242438;
        font-size: 12px;
        margin: 10px 0px;
        padding: 20px 0px;
      }
      #workspaces button {
        padding: 2px;
        background-color: #F5C2E7;
        color: #F5C2E7;
        margin: 5px 6px;
        border-radius: 10px;
      }
    '';
  };
}