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
            "*" = 5;
          };
        };

      };
    };
    style = ''
      window#waybar {
        background: #211499;
        border: 1px solid #E8E546;
        border-radius: 5px;


      }

      #workspaces {
        margin: 5px 0px;
        background: #46E874;
        font-size: 12pt;
        padding: 5px 0px;
        border-top:3px solid #46E874;
        border-top-left-radius: 50px;
        border-top-right-radius: 5px;
        border-bottom: 3px solid #46E874;
        border-bottom-right-radius: 50px;
        border-bottom-left-radius: 5px;
      }
    '';
  };
}