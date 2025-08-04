{
  description = "Standalone Home Manager + NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  hyprland = {

   url = "github:hyprwm/Hyprland/v0.50.1";
  inputs.nixpkgs.follows = "nixpkgs";
  };

};
  outputs = { self, nixpkgs, home-manager, ... } @ inputs:

    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
      	inherit system;
      };
    in {

      nixosConfigurations.omen = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
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
