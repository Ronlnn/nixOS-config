{
  home.file.".config/wlogout/style.css".text = ''
  window {
    background-color: #1e1e2e;
  }

  button {
    background-color: #313244;
    border-radius: 12px;
    padding: 20px;
    margin: 10px;
    color: #cdd6f4;
  }

  button:hover {
    background-color: #45475a;
    color: #a6e3a1;
  }
'';

home.file.".config/wlogout/layout".text = ''
  logout, , pkill -KILL -u $USER
  shutdown, , systemctl poweroff
  reboot, , systemctl reboot
  lock, , swaylock
  suspend, , systemctl suspend
'';

}