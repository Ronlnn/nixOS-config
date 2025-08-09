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
      image = "~/Pictures/Walls/rei.jpg";

      # Используем правильный формат цветов (RRGGBBAA)
      ring-color = "E8546000";    # Прозрачное кольцо (AA=00)
      inside-color = "1E1E2EBF";  # Полупрозрачная внутренняя часть (BF = 75%)
      line-color = "E85460BF";    # Полупрозрачная линия (BF = 75%)
      separator-color = "00000000"; # Прозрачный разделитель

      # Настройки текста и его фона
      text-color = "E85460BF";     # Цвет текста (совпадает с индикатором)
      text-bg-color = "1E1E2EBF";  # Полностью прозрачный фон текста
      text-bg-radius = 15;         # Радиус скругления фона текста
      text-caps-lock-color = "54E8D7BF"; # Цвет надписи Caps Lock
    };
  };
}