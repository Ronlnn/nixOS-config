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
        modules-center = ["clock" "cava"];
        modules-right = ["backlight" "group/hardware" "bluetooth"];
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            "1" = "󰪥"; "2" = "󰪥"; "3" = "󰪥"; "4" = "󰪥"; "5" = "󰪥";
            "6" = "󰪥"; "7" = "󰪥"; "8" = "󰪥"; "9" = "󰪥"; "10" = "󰪥";
          };
          on-click = "activate";
        };
        "group/hardware" = {
          orientation = "horizontal";
          modules = ["cpu" "memory" "battery"];
        };
        "battery" = {
          states = {
            warning = 30;
            critical = 15;
          };
          format = "<big>{icon}</big> {capacity}%";
          format-icons = ["󰁺" "󰁻" "󰁼" "󰁽" "󰂀" "<big>󰂂</big>" ];
          interval = 10;
          max-length = 20;
        };
        "cpu" = {
          interval = 10;
          format = "<big>{icon}</big> {usage}%";
          format-icons = ["<big></big> "];
        };
        "memory" = {
          interval = 30;
          format = "  {used}/{total}";
        };
        "bluetooth" = {
          format = "<big>󰂯</big> {status}";
          on-click = "blueman-manager";
        };
        "backlight" = {
          device = "intel_backlight";
          scroll-step = 10.0;
          format = "<big>{icon}</big>  {percent}%";
          format-icons = ["<big>󱩎</big> " "<big>󱩒</big> " "<big>󱩔</big> " "<big>󱩖</big>"];
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

      /* Группа Hardware */
      #group-hardware {
        min-width: 160px;
        padding: 0 12px;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
      }

      /* Батарея */
      #battery {
        min-width: 46px;
        padding: 0 12px;
        color: #7BD62B;
        background: #1E1E2E;
        border-radius: 20px;
      }

       /* CPU */
       #cpu {
        min-width: 46px;
        padding: 0 12px;
        color: #ED7026;
        background: #1E1E2E;
        border-radius: 20px;
       }

      /* Memory */
      #memory {
        min-width: 46px;
        padding: 0 12px;
        color: #16517A;
        background: #1E1E2E;
        border-radius: 20px;
      }

      /* Блютуз */
      #bluetooth {
        min-width: 36px;
        padding: 0 12px;
        color: #88DAEA;
        background: #1E1E2E;
        border-radius: 20px;
        margin: 4px;
      }

      /* Яркость */
      #backlight {
        min-width: 46px;
        padding: 0 12px;
        color: #FAF839;
        background: #1E1E2E;
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