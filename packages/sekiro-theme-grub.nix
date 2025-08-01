{ stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  name = "sekiro-grub-theme";
  version = "1.0";

  src = fetchFromGitHub {
    owner = "AbijithBalaji";
    repo = "sekiro_grub_theme";
    rev = "1b1e3840e9c378f4400bed2a8940f4ded364ba3f";
    sha256 = "sha256-uXwDjb0+ViQvdesG5gefC5zFAiFs/FfDfeI5t7vP+Qc=";
  };

  # Указываем правильный путь к файлам темы
  preConfigure = ''
    cd Sekiro
  '';

  installPhase = ''
    # Создаём стандартную структуру GRUB темы
    mkdir -p $out/grub/themes/sekiro

    # Копируем все файлы темы
    cp -r ./* $out/grub/themes/sekiro/

    # Проверяем наличие обязательных файлов
    if [ ! -f "$out/grub/themes/sekiro/theme.txt" ]; then
      echo "ERROR: theme.txt not found in $out/grub/themes/sekiro/"
      ls -la $out/grub/themes/sekiro/
      exit 1
    fi

    echo "Theme installed successfully:"
    ls -la $out/grub/themes/sekiro/
  '';
}