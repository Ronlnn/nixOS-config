{ config, pkgs, ... }: {
  programs.nix-ld = {
    enable = true;
    # Дополнительные библиотеки, которые могут понадобиться
    libraries = with pkgs; [
      stdenv.cc.cc
      zlib
      fuse
      libepoxy
      glib
      gtk3
      xorg.libX11
      xorg.libXcursor
      xorg.libXrandr
      xorg.libXi
    ];
  };
}