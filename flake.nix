{
  description = "Standalone Home Manager + NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    
    hyprland = {
    	url = "github:hyprwm/Hyprland";
    };
  };
  outputs = {self, nixpkgs, home-manager, hyprland, ... }:

    let
      system = "x86_64-linux";
      overlays = [ hyprland.overlays.default ];
      pkgs = import nixpkgs {
      	inherit system;
      	overlays = overlays;
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
        
        modules = [./home.nix];
      };
    };
}
