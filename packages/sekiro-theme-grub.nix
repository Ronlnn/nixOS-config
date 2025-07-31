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


 installPhase = ''
    mkdir -p $out/themes/sekiro
    cp -r *.png *.txt $out/themes/sekiro/
  '';
}
