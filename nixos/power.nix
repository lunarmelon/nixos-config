# Configure power profile and modes
# Only needed for laptops
{
  services = {
    # Closed lid behavior
    logind.settings.Login = {
      HandleLidSwitch = "poweroff";
      HandleLidSwitchExternalPower = "lock";
      HandleLidSwitchDocked = "ignore";
    };
    # Disable default DE power profile
    # power-profiles-daemon.enable = false;
    # tlp = {
    # enable = true;
    # settings = {
    # CPU_SCALING_GOVERNOR_ON_AC = "performance";
    # CPU_SCALING_GOVERNOR_ON_BAT = "schedutil";
    #
    # CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
    # CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
    #
    # CPU_MIN_PERF_ON_AC = 0;
    # CPU_MAX_PERF_ON_AC = 100;
    # CPU_MIN_PERF_ON_BAT = 0;
    # CPU_MAX_PERF_ON_BAT = 80;
    # };
    # };
  };
}
