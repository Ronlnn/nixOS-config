{
  description = "System Configuration with standalone Home Manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in {
      # NixOS system config without home-manager module
      nixosConfigurations.omen = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix
          # НЕ добавляем home-manager.nixosModules.home-manager
          # home-manager интеграция выключена
        ];
      };

      # Отдельный standalone home-manager конфиг
       homeConfigurations = {
        roninn = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home-manager/home.nix ];
          name = "roninn";
          homeDirectory = "/home/roninn";
        };
      };
    };
}
