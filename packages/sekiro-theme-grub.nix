{config, pkgs, ...}:
{
   sekiroGrubTheme = pkgs.stdenv.mkDerivation {
    name = "sekiro-grub-theme";
    src = pkgs.fetchFromGitHub {
      owner = "AbijithBalaji";
      repo = "sekiro_grub_theme";
      rev = "1b1e3840e9c378f4400bed2a8940f4ded364ba3f"; # фиксируй на конкретный коммит!
      sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA="; # см. ниже
    };

    installPhase = ''
      mkdir -p $out
      cp -r * $out/
    '';
  };
}