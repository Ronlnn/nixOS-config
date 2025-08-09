{config, pkgs, ...}:
{
  programs.swaylock = {
    enable = true;
    settings = {
      color = "1E1E2E";
      font-size = 24;
      indicator-idle-visible = true;
      indicator-radius = 100;
      show-failed-attempts = false;
      image = "~/Pictures/Walls/samurai-3.jpg";

      # Используем правильный формат цветов (RRGGBBAA)
      ring-color = "54E8D700";    # Прозрачное кольцо (AA=00)
      inside-color = "54E8D7BF";  # Полупрозрачная внутренняя часть (BF = 75%)
      line-color = "54E8D7BF";    # Полупрозрачная линия (BF = 75%)
      separator-color = "00000000"; # Прозрачный разделитель
    };
  };
}