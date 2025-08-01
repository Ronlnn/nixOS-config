{ pkgs, ... }:

let
  sddmAstronautTheme = pkgs.fetchFromGitHub {
    owner = "sylv1on";
    repo = "sddm-astronaut-theme";
    rev = "3ef9f511fd072ff3dbb6eb3c1c499a71f338967e";
    sha256 = "sha256-Xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx=";
  };
in {
  environment.etc."sddm/themes/astronaut".source = sddmAstronautTheme;

  services.xserver.displayManager.sddm = {
    enable = true;
    theme = "astronaut";
  };
}
