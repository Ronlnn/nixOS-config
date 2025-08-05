{


  programs.wlogout.layout = [
    {
      label = "Logout";
      action = "";
      text = "Log Out";

    }
    {
      label = "Shut Down";
      action = "systemctl poweroff";
      text = "Shutdown";
    }
  ];
  programs.wlogout = {
    enable = true;
    style = ''
      window {
        background_color = #1E1E2E
      }
      button {
        border-radius = 8
        border-color = #6E6C7E
        border-style = solid
        border-width = 2
        color = #C6A0F6
        font-family=  JetBrainsMono Nerd Font
        font-size = 12
      }
    '';
  };
}
