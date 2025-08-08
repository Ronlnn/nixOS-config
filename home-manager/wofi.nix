{config, pkgs, ...}:
{
  programs.wofi = {
    enable = true;
    settings = {
      width = 600;
      height = 400;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      intensitive = true;
      allow_images = true;
      image_size = 24;
      exec_search = false;
      hide_scroll = true;
      columns = 2;
    };
    style = ''
      * {
        font-family: JetBrainsMono Nerd Font, sans-serif;
        font-size: 18px;
        font-weight: bold;
      }
      window {
        background-color: rgba(30, 30, 46, 0.75);
        border-radius: 15px;
        border: 2px solid #54E1F0;
      }
      #input {
        background-color: rgba(30, 30, 46, 0.75);
        color: #EBF0EF;
        border-radius: 15px;
        border: 2px solid #54E1F0;
        margin: 10px;
        padding: 10px;
      }
      #inner-box {
        background-color: transparent;
      }
      #outer-box {
        background-color: transparent;
        margin: 10px;
      }
      #scroll {
        background-color: transparent;
      }
      #entry {
        background-color: transparent;
        color: #EBF0EF;
        padding: 8px;
        border-radius: 8px;
      }
      #entry:selected {
        background-color: transparent;
        border: 1px solid #54E1F0;
      }
      #entry image {
        margin-right: 10px;
      }
    '';
  };
}