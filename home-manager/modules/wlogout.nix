{
  programs.wlogout.enable = true;

  programs.wlogout.layout = [
    {
      label = {
        font = "JetBrainsMono Nerd Font 12";
        color = "#C6A0F6";  # lavender
      };
    }
    {
      style = {
        background = "#1E1E2E";  # mocha background
        border = "#6E6C7E";      # overlay2 border
        borderWidth = "2";
        radius = "8";
        buttonColor = "#FAB387";       # peach
        buttonHoverColor = "#F2CDCD";  # lighter peach
        labelColor = "#C6A0F6";        # lavender
        shadow = "0 0 15px #00000088";
      };
    }
  ];
}
