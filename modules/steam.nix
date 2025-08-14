# {pkgs, ...}:
# {
#   programs.steam.enable = true;
#   programs.steam.gamescopeSession.enable = true;
#   programs.gamemode.enable = true;

#   environment.systemPackages = with pkgs; [
#     protonup
#     protontricks
#     protonplus
#     protonup-qt
#   ];

#   environment.sessionVariables = {
#     STEAM_EXTRA_COMPAT_TOOLS_PATHS =
#       "/home/roninn/.steam/root/compatibilitytools.d";
#   };
# }