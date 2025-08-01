{
  programs.waybar = {
    enable = true;
    # Запускает waybar когда идет сессия hyprland
    systemd.target = "hyprland-session.target";
  };
}