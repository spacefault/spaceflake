{config, ...}: {
  programs.htop = {
    enable = true;
    settings =
      {
        color_scheme = 0;
        cpu_count_from_one = 0;
        delay = 10;
        highlight_changes = 1;
        detailed_cpu_time = 1;
        tree_view_always_by_pid = 1;
        tree_view = 1;
        fields = with config.lib.htop.fields; [
          PID
          USER
          PRIORITY
          NICE
          M_SIZE
          M_RESIDENT
          M_SHARE
          STATE
          PERCENT_CPU
          PERCENT_MEM
          TIME
          COMM
        ];
        highlight_base_name = 1;
        highlight_megabytes = 1;
        highlight_threads = 1;
      }
      // (with config.lib.htop;
        leftMeters [
          (text "DateTime")
          (text "Uptime")
          (text "Hostname")
          (text "System")
          (text "LoadAverage")
          (text "Tasks")
        ])
      // (with config.lib.htop;
        rightMeters [
          (text "NetworkIO")
          (text "DiskIO")
          (bar "CPU")
          (bar "GPU")
        ]);
  };
}
