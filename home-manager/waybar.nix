{ config, ... }: {
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        margin-top = 8;
        margin-bottom = 8;
        margin-left = 8;
        reload_style_on_change = true;
        modules-left = ["hyprland/workspaces"];
        modules-center = ["clock#date" "clock#time"];
        modules-right = ["pulseaudio/slider" "pulseaudio#percentage"];
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
        "clock#date" = {
          format = "{:%a %B %d}";
          tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          rotate = 270;
        };
        "clock#time" = {
          format = "{:%I:%M}";
        };
        "pulseaudio" = {
          format = "{icon}";
          format-bluetooth = "{icon}";
          format-muted = "";
          format-icons = {
            headphones = "";
            default = [""];
          };
          scroll-step = 1;
          on-click = "pavucontrol";
        };
        "pulseaudio#percentage" = {
          on-click = "pactl set-sink-mute @DEFAULT_SINK@ toggle";
          format = "{volume}%";
        };
        "pulseaudio/slider" = {
          min = 0;
          max = 100;
          orientation = "vertical";
        };
      };
    };
    style = ''
      * {
        all: initial;
        font-family:'JetBrainsMono Nerd Font';
        padding-left: 1px;
        padding-right: 1px;
      }

      window#waybar {
        background: #1e1e2e;
        border: 1px solid #f5c2e7;
        border-radius: 5px;
      }

      tooltip {
        background: #313244;
        border: 2px solid #94e2d5;
        border-radius: 5px;
        font-size: 12pt;
      }

      tooltip label {
        padding: 10px;
      }

      #workspaces {
        margin: 10px 0px;
        background: #181825;
        font-size: 12pt;
        padding: 20px 0px;
        border-top: 3px solid #f5c2e7;
        border-top-left-radius: 50px;
        border-top-right-radius: 5px;
        border-bottom: 3px solid #f5c2e7;
        border-bottom-right-radius: 50px;
        border-bottom-left-radius: 5px;
      }

      #workspaces button {
        font-size: 18pt;
        padding: 2px;
        margin: 5px 6px;
        border-radius: 10px;
      }

      #workspaces button.persistent {
        background-color: #bac2de;
      }

      #workspaces button.empty {
        background-color: #45475a;
      }

      #workspaces button.visible {
        background-color: #45475a;
      }

      #workspaces button.active {
        background-color: #a6e3a1;
      }

      #workspaces button.urgent {
        background-color: #f38ba8;
      }

      #workspaces button:hover {
        background-color: #fab387;
      }

      #pulseaudio, #clock, #clock.date, #clock.time {
        background: #181825;
      }

      #pulseaudio {
        padding: 1px 5px 1px 5px;
        color: #cdd6f4;
        font-size: 16px;
      }

      #clock.date {
        padding: 30px 5px 10px 5px;
        font-size: 14px;
        color: #cdd6f4;
        border-top: 3px solid #f5c2e7;
        border-top-left-radius: 50px;
        border-top-right-radius: 5px;
      }

      #clock.time {
        padding: 10px 5px 30px 5px;
        font-size: 14px;
        color: #94e2d5;
        border-bottom: 3px solid #f5c2e7;
        border-bottom-left-radius: 5px;
        border-bottom-right-radius: 50px;
      }

      #pulseaudio-slider, #pulseaudio.percentage {
        background-color: #181825;
      }

      #pulseaudio-slider {
        padding: 15px 0px 5px 0px;
        border-top: 3px solid #f5c2e7;
        border-top-left-radius: 50px;
        border-top-right-radius: 5px;
      }

      #pulseaudio-slider slider {
        min-height: 0px;
        min-width: 1px;
        opacity: 0;
        background-image: none;
        border: none;
        box-shadow: none;
      }

      #pulseaudio-slider trough {
        min-height: 70px;
        min-width: 0px;
        border-radius: 5px;
        background-color: #f5c2e7;
      }

      #pulseaudio-slider highlight {
        min-width: 10px;
        border-radius: 5px;
        background-color: #ffffff;
      }

      #pulseaudio.percentage {
        font-size: 12px;
        margin: 0px 0px;
        padding: 2px 5px;
        color: #cdd6f4;
      }
    '';
  };
}
