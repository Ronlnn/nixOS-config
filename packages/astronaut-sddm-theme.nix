{pkgs}:

pkgs.stdenv.mkDerivation {
  pname = "astronaut-sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "Keyitdev";
    repo = "sddm-astronaut-theme";
    rev = "3ef9f511fd072ff3dbb6eb3c1c499a71f338967e";
    sha256 = "0pjghj2w0gdiksb6zi04yc5r217jckknw0ijayfdimfaidkv6w6z";
  };
  installPhase = ''
    mkdir -p $out/share/sddm/themes/astronaut
    cp -r * $out/share/sddm/themes/astronaut
    cp Themes/japanese_aesthetic.conf $out/share/sddm/themes/astronaut/theme.conf
  '';
}