{ pkgs, ... }: {
  programs.appimage = {
    enable = true;
    binfmt = true;
    package = pkgs.appimage-run.override {
      extraPkgs = pkgs: [
        pkgs.libepoxy
        pkgs.libpng
        pkgs.fuse3
        pkgs.zlib
        pkgs.glib
      ];
    };
  };
}
