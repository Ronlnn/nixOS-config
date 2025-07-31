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

  sourceRoot = "${src.name}/Sekiro";

  installPhase = ''
    # 1. Создаём структуру как ожидает GRUB
    mkdir -p $out/grub/themes/sekiro

    # 2. Копируем все файлы без изменений
    cp -r ./* $out/grub/themes/sekiro/

    # 3. Проверяем наличие критических файлов
    echo "Проверка содержимого:"
    ls -la $out/grub/themes/sekiro/
    test -f "$out/grub/themes/sekiro/theme.txt" || { echo "ERROR: theme.txt not found!"; exit 1; }
    test -f "$out/grub/themes/sekiro/sekiro_1920x1080.png" || { echo "ERROR: background image not found!"; exit 1; }
  '';
}
