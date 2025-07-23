{ config, pkgs, ... }:

{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    nvidiaSettings = true;
    open = false; # GTX 1650 — проприетарный драйвер
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      sync.enable = true;  # вместо offload
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # (опционально) добавить nvidia-smi, nvidia-settings
  environment.systemPackages = with pkgs; [
       # NVIDIA
    ## Показывает инфу о текущей OpenGL-конфигурации
    glxinfo
    ## Диагностика Vulkan
    vulkan-tools
    ## Мониторинг загрузки видеокарты в реальном времени
    nvtopPackages.full
  ];
}
