{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wlogout
    swaylock  # для блокировки экрана (если используете)
  ];

  xdg.configFile = {
    # Layout с кнопками (Lock, Logout, Reboot, Shutdown, Suspend)
    "wlogout/layout".text = ''
      {
        "label": "lock",
        "action": "swaylock -f -c 1E1E2E",
        "text": "Lock",
        "keybind": "l"
      }
      {
        "label": "logout",
        "action": "loginctl terminate-user $USER",
        "text": "Logout",
        "keybind": "e"
      }
      {
        "label": "reboot",
        "action": "systemctl reboot",
        "text": "Reboot",
        "keybind": "r"
      }
      {
        "label": "shutdown",
        "action": "systemctl poweroff",
        "text": "Shutdown",
        "keybind": "s"
      }
      {
        "label": "suspend",
        "action": "systemctl suspend",
        "text": "Sleep",
        "keybind": "z"
      }
    '';

    # Стиль Catppuccin Mocha
    "wlogout/style.css".text = ''
      * {
          font-family: "Fira Code", "JetBrains Mono", monospace;
          font-size: 14px;
      }

      window {
          background-color: rgba(30, 30, 46, 0.8);
      }

      button {
          background-color: #1E1E2E;
          color: #CDD6F4;
          border: 2px solid #313244;
          border-radius: 12px;
          padding: 20px;
          margin: 10px;
          background-repeat: no-repeat;
          background-position: center;
          background-size: 25%;
      }

      button:focus, button:hover {
          background-color: #313244;
          color: #F5E0DC;
          border: 2px solid #F5C2E7;
          outline-style: none;
      }

      #lock {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
      }

      #logout {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
      }

      #shutdown {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
      }

      #reboot {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
      }

      #suspend {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
      }
    '';
  };
}