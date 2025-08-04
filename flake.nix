{
  description = "Standalone Home Manager + NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland.url = "github:hyprwm/Hyprland";

};
  outputs = { self, nixpkgs, home-manager, hyprland, ... }:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
      	inherit system;
      };
    in {

      nixosConfigurations.omen = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
        ];

      };
      homeConfigurations.roninn = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        wayland.windowManager.hyprland = {
          enable = true;
          xwayland.enable = true;
          package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
          portalPackage = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
        };
        modules = [./home.nix];
      };
    };
}
