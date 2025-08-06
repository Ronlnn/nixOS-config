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
          persistent-workspaces = {
            "1" = ["HDMI-A-2"];
            "2" = ["HDMI-A-2"];
            "3" = ["HDMI-A-2"];
            "4" = ["HDMI-A-2"];
            "5" = ["HDMI-A-2"];
            "6" = ["eDP-1"];
            "7" = ["eDP-1"];
            "8" = ["eDP-1"];
            "9" = ["eDP-1"];
            "10" = ["eDP-1"];
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
        background: #46E874;
        font-size: 12px;
      }
    '';
  };
}