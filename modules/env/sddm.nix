{config, lib, pkgs,...}:

{
  config = lib.mkIf config.hyprland.enable {
    services.displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "astronaut";
      package = pkgs.kdePackages.sddm;

    };
    environment.systemPackages = with pkgs; [
      catppuccin-sddm
      sddm-astronaut
    ];
  };
}
