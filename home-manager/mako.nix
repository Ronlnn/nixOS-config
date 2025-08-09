{config, pkgs, ...}:
{
  services.mako = {
    enable = true;
    settings = {
      actions = true;
      anchor = "top-right";
      text-color = "#FCFCFC";
      background-color = "#1E1E2E";
      border-color = "#B823EB";
      border-radius = 20;
      border-size = 1;
      font = "FiraCode Nerd Font, sans-serif";
      height = 100;
      width = 300;
      icons = true;
      ignore-timeout = false;
      default-timeout = 3000;
      layer = "top";
      margin = 10;
      markup = true;
      max-history = 3;
      on-button-left = "invoke-default-action";
      on-button-right = "dismiss";
    };
  };
}