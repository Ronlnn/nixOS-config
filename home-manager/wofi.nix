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
        font-size: 14px;
      }
      window {
        background_color: #1E1E2E;
        border-radius: 15px;
        border: 2px solid #54E1F0;
      }
      #input {
        background_color: #1E1E2E;
        color: #EBF0EF;
        border-radius: 15px;
        border: 2px solid #54E1F0;
        margin: 10px;
        padding: 10px;
      }
      #inner-box {
        background_color: #F2F077;
      }
      #outer-box {
        background_color: #F277A0;
        margin: 10px;
      }
      #scroll {
        background_color: #F277DD;
      }
      #entry {
        background_color: #77F27D;
        color: #EBF0EF;
        padding: 8px;
        border-radius: 8px;
      }
      #entry:selected {
        background_color: #CBF277;
        border: 1px solid #CBF277;
      }
      #entry image {
        margin-right: 10px;
      }
    '';
  };
}