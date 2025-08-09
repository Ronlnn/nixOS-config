{config, pkgs, ...}:
{
  programs.swaylock = {
    enable = true;
    settings = {
      color = "1E1E2E";
      font-size = 24;
      indicator-idle-visible = true;
      indicator-radius = 100;
      line-color = "54E8D7";
      inside-color = "54E8D7";
      show-failed-attempts = false;
      image = "~/Pictures/Walls/samurai-3.jpg";
    };
  };
}