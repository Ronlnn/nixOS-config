{config, lib, ...}:
with lib;
{
	# Сборщик всех модулей
	imports = [
		./user.nix
		./grub.nix
		./network.nix
		./sound.nix
		./nvidia.nix
		./nix-ld.nix
		./flatpak.nix
		./steam.nix
		./thunar.nix
	];

	options = {
		gnome.enable = mkOption {
			type = types.bool;
			default = false;
			description = "Enable GNOME desktop environment";
		};

		hyprland.enable = mkOption{
			type = types.bool;
			default = false;
			description = "Enable Hyprland window manager";
		};
	};
}
