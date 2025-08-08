{config, pkgs, ...}:
{
  imports = [
    ./cava.nix
  ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 40;
        modules-left = ["hyprland/workspaces"];
        modules-center = ["user"  "clock" "mpris" "cava"];
        modules-right = ["backlight" "pulseaudio" "cpu" "memory" "battery" "bluetooth" "network" "custom/off"];
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "󰪥"; "2" = "󰪥"; "3" = "󰪥"; "4" = "󰪥"; "5" = "󰪥";
            "6" = "󰪥"; "7" = "󰪥"; "8" = "󰪥"; "9" = "󰪥"; "10" = "󰪥";
          };
          on-click = "activate";
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "{icon}{capacity}% ";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰂀" "<big>󰂂</big>" ];
          interval = 10;
          max-length = 20;
        };
        "cpu" = {
          interval = 10;
          format = "{icon} {usage}%";
          format-icons = [" <big></big>"];
        };
        "memory" = {
          interval = 30;
          format = "<big> </big>{used}Gb";
        };
        "bluetooth" = {
          format = "<big></big>";
          on-click = "blueman-manager";
        };
        "network" = {
          interval = 60;
          format-wifi = "<big> </big>";
          format-ethernet = "<big>󰈁</big> ";
          on-click = "";
        };
        "custom/off" = {
          format = "<big></big>";
          on-click = "wlogout";
        };
        "backlight" = {
          device = "intel_backlight";
          scroll-step = 10.0;
          format = "<big>{icon}</big>";
          format-icons = ["<big>󱩎</big> " "<big>󱩒</big> " "<big>󱩔</big> " "<big>󱩖</big>"];
        };
        "pulseaudio" = {
          format = " <big>{icon}</big> {volume}% ";
          format-bluetooth = "<big>{icon}</big> <big></big>";
          format-muted = "<big>󰖁</big>";
          format-icons = {
            headphones = "<big></big>";
            default = "<big>󰕾</big>";
          };
          scroll-step = 10;
          on-click = "pavucontrol";
        };
        "cava" = {
          format-icons = ["▁""▂""▃""▄""▅""▆""▇""█"];
          cava_config = "${config.xdg.configHome}/cava/config";
          bars = 8;
          };
        "clock" = {
            interval = 60;
            format = "<big>󰥔</big> {:%H:%M %d %B}";
            timezone = "Europe/Moscow";
            max-length = 25;
            format-alt =  "{:%A, %B %d, %Y (%R)}  ";
            tooltip-format = "<tt><small>{calendar}</small></tt>";
            calendar = {
              mode = "year";
              mode-mon-col = 3;
              on-scroll = 1;
              format = {
                months =  "<span color='#ffead3'><b>{}</b></span>";
                days = "<span color='#F7F7F7'><b>{}</b></span>";
                weeksdays = "<span color='#ffcc66'><b>{}</b></span>";
                today = "<span color='#ff6699'><b><u>{}</u></b></span>";
              };
            };
            actions = {
              on-click-right = "mode";
            };
          };
          "mpris" = {
            player = "spotify";
            format = "{player_icon} {title}";
            format-paused = "<big> </big>{title}-{artist}";
            format-stopped = "<big> </big>Stopped";
            tooltip-format = "{album}\n{title}\nby {artist}";
            player-icons = {
              default = "<big></big>";
              mvp = "<big></big>";
              spotify = "<big></big>";
              vlc = "<big>󰕼</big>";
            };
            on-click = "playerctl play-pause";
            on-click-right = "playerctl stop";
            on-scroll-up = "playerctl next";
            on-scroll-down = "playerctl previous";
          };
          "user" = {
            interval = 60;
            format = " {user} ";
            height = 30;
            width = 30;
            avatar = "${config.home.homeDirectory}/Pictures/zenitsu-avatar.png";
            icon = true;
            icon-size = 62;
          };
      };
    };
    style = ''
      * {
      font-family: "FiraCode Nerd Font", sans-serif;
      font-size: 14px;
      font-weight: bold;
      }
      window#waybar {
        background: rgba(17, 17, 27, 0.5);
        padding: 4px;
      }

      /* Батарея */
      #battery {
        min-width: 50px;
        color: #7BD62B;
        background: #1E1E2E;
        border-radius: 0 20px 20px 0;
        margin: 4px 0 4px 0;
        padding: 6px 0 6px 2px;
      }

       /* CPU */
       #cpu {
        min-width: 50px;
        color: #ED7026;
        background: #1E1E2E;
        border-radius: 20px 0 0 20px;
        margin: 4px 0 4px 0;
        padding: 0 6px;
       }

      /* Memory */
      #memory {
        min-width: 50px;
        color: #63AEFF;
        background: #1E1E2E;
        border-radius: 0;
        margin: 4px 0 4px 0;
        padding: 0 6px;
      }

      /* Блютуз */
      #bluetooth {
        min-width: 36px;
        padding: 0 10px;
        color: #88DAEA;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
      }

      /* Network */
      #network {
        min-width: 40px;
        padding: 6px 6px;
        color: #CAA6F7;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
      }

      /* OFF */
      #custom-off {
        min-width: 35px;
        padding: 6px 6px;
        color: #DB4D42;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
      }

      /* Яркость */
      #backlight {
        min-width: 40px;
        padding: 6px 6px;
        color: #FAF839;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
      }

      /* Volume */
      #pulseaudio {
        min-width: 50px;
        color: #EBA0AC;
        background: #1E1E2E;
        padding: 6px 6px;
        border-radius: 20px;
        margin: 4px;
      }

       /* Cava */
       #cava {
        min-width: 76px;
        padding: 0 12px;
        color: #26EDC9;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
       }

       /* Clock */
      #clock {
        min-width: 36px;
        padding: 0 12px;
        color: #F7F7F7;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
      }

      /* MPRIS */
      #mpris {
        min-width: 76px;
        padding: 0 12px;
        color: #26EDC9;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
      }

      /* User */
      #user {
        color: #F38BA8;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
        padding: 6px;
      }

      /* Workspaces */
      #workspaces {
        background: #242438;
        border-radius: 20px;
        margin: 4px;
        padding: 2px;
      }
      #workspaces button {
        min-width: 24px;
        min-height: 24px;
        margin: 0;
        padding: 0;
        color: #F38BA8;
      }
      #workspaces button.active {
        border-bottom: 2px solid #F38BA8;
        border-radius: 0 0 10px 10px;
        background: transparent;
        transition: border-color 0.2s ease;
      }
      #workspaces button.urgent {
        color: #F38BA8;
      }
      #workspaces button.empty {
        color: #CDD6F4;
      }
      #workspaces button:hover {
        color: #F38BA8;
        background: transparent;
        border-bottom: 2px solid #F38BA8;
      }
    '';
  };
}