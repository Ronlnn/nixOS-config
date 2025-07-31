{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation {
  pname = "sekiro-grub-theme";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "AbijithBalaji";
    repo = "sekiro_grub_theme";
    rev = "1b1e3840e9c378f4400bed2a8940f4ded364ba3f"; # пример
    sha256 = "sha256-uXwDjb0+ViQvdesG5gefC5zFAiFs/FfDfeI5t7vP+Qc=";
  };

  # Указываем точный путь к файлам
  sourceRoot = "${src.name}/Sekiro";
  installPhase = ''
    # 1. Создаём стандартную структуру темы GRUB
    mkdir -p $out/themes/sekiro

    # 2. Копируем только необходимые файлы
    cp sekiro_1920x1080.png $out/themes/sekiro/background.png
    cp theme.txt $out/themes/sekiro/
    cp *.pf2 $out/themes/sekiro/  # Шрифты

    # 3. Проверяем содержимое theme.txt (должно ссылаться на background.png)
    sed -i 's|desktop-image:.*|desktop-image: "background.png"|' $out/themes/sekiro/theme.txt

    # 4. Проверка результата
    echo "Содержимое темы:"
    ls -la $out/themes/sekiro/
    cat $out/themes/sekiro/theme.txt
  '';
}
