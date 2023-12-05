{
  inputs,
  config,
  lib,
  ...
}: {
  imports = [
    inputs.auto-cpufreq.nixosModules.default
  ];

  config = lib.mkIf config.hm.banana-hm.battery.enable {
    # Better scheduling for CPU cycles
    services.system76-scheduler.settings.cfsProfiles.enable = true;

    programs.auto-cpufreq = {
      enable = true;
      settings = {
        charger = {
          governor = "performance";
          turbo = "auto";
        };

        battery = {
          governor = "powersave";
          turbo = "auto";
        };
      };
    };

    # Enable TLP (better than gnomes internal power manager)
    services.tlp = {
      enable = true;
      settings = {
        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      };
    };

    # Disable GNOMEs power management
    services.power-profiles-daemon.enable = false;
    #
    # # Enable powertop
    powerManagement.powertop.enable = lib.mkForce true;
    #
    # # Enable thermald (only necessary if on Intel CPUs)
    services.thermald.enable = true;
  };
}
