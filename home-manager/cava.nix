{config, pkgs, ...}:
{
  programs.cava = {
    enable = true;
    settings = {
      general = {
        mode = "normal";
        framerate = 30;
        autosens = 1;
        bars = 8;
        bar_width = 3;
        bar_spacing = 1;
        lower_cutoff_freq = 50;
        higher_cutoff_freq = 10000;
      };
      input = {
        method = "pulse";
        source = "auto";
        sample_rate = 44100;
        sample_bits = 16;
        autoconnect = 2;
        active = 0;
        remix = 1;
      };
      output = {
        method = "raw";
        orientation = "bottom";
        raw_target = "/dev/stdout";
        data_format = "binary";
        bit_format = "16bit";
        ascii_max_range = 1000;
        stereo = true;
        bar_delimiter = 0;
      };
    };
  };
}