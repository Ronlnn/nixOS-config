{config, pkgs, ...}:
{
  programs.swaylock = {
    enable = true;
    settings = {
      color = "1E1E2E";
      font-size = 24;
      indicator-idle-visible = true;
      indicator-radius = 100;
      line-color = "84, 232, 215, 0.75";
      inside-color = "84, 232, 215, 0.75";
      show-failed-attempts = false;
      image = "~/Pictures/Walls/samurai-3.jpg";
    };
  };
}