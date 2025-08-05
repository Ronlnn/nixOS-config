{config, lib, pkgs,...}:

let
  customBackground = ../../walls/purp.jpg;

  customTheme = pkgs.catppuccin-sddm.override {
    background = customBackground;
  };
in
{
  config = lib.mkIf config.hyprland.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "catppuccin-mocha";
      package = pkgs.kdePackages.sddm;

    };
    environment.systemPackages = with pkgs; [
      catppuccin-sddm
      sddm-astronaut
      customTheme
    ];
  };
}
