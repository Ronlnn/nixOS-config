{
  programs.wlogout.enable = true;

  programs.wlogout.layout = {
    label = {
      font = "JetBrainsMono Nerd Font 12"; # можно свой шрифт
      color = "#C6A0F6"; # цвет текста — возьмём из палитры Catppuccin Mocha (lavender)
    };

    style = {
      background = "#1E1E2E";  # Catppuccin Mocha background
      border = "#6E6C7E";      # border color из палитры (overlay2)
      borderWidth = "2";
      radius = "8";            # радиус скругления углов
      buttonColor = "#FAB387"; # цвет кнопок (peach)
      buttonHoverColor = "#F2CDCD"; # цвет кнопок при наведении
      labelColor = "#C6A0F6";  # цвет текста на кнопках
      shadow = "0 0 15px #00000088"; # небольшой теневой эффект
    };
  };
}
