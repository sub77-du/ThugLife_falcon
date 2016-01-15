#!/system/bin/sh

# custom busybox installation shortcut
bb=/sbin/bb/busybox;

# Dynamic FPS
    chown system graphics /sys/class/graphics/fb0/dynamic_fps
    chmod 0644 /sys/class/graphics/fb0/dynamic_fps

# Set TCP westwood
	echo "westwood" > /proc/sys/net/ipv4/tcp_congestion_control

# Set IOSched
 echo bfq > /sys/block/mmcblk0/queue/scheduler
 echo "512" > /sys/block/mmcblk0/bdi/read_ahead_kb

# CPU MIN FREQ
echo 300000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
echo 300000 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_min_freq
echo 300000 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_min_freq
echo 300000 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_min_freq

# MSM Hotplug tweaks
echo 1 > /sys/module/msm_hotplug/msm_enabled
echo 2 > /sys/module/msm_hotplug/min_cpus_online
echo 500 > /sys/module/msm_hotplug/down_lock_duration
echo 2500 > /sys/module/msm_hotplug/boost_lock_duration
echo "200 5:100 50:50 350:200" > /sys/module/msm_hotplug/update_rates
echo 100 > /sys/module/msm_hotplug/fast_lane_load

#Impulse Governor Tuning
echo 20000 1400000:40000 1700000:20000 > /sys/devices/system/cpu/cpufreq/impulse/above_hispeed_delay
echo 998400 > /sys/devices/system/cpu/cpufreq/impulse/hispeed_freq
echo 1 > /sys/devices/system/cpu/cpufreq/impulse/io_is_busy
echo 85 1500000:90 1800000:70 > /sys/devices/system/cpu/cpufreq/impulse/target_loads
echo 40000 > /sys/devices/system/cpu/cpufreq/impulse/min_sample_time
echo 30000 > /sys/devices/system/cpu/cpufreq/impulse/timer_rate
echo 100000 > /sys/devices/system/cpu/cpufreq/impulse/max_freq_hysteresis
echo 30000 > /sys/devices/system/cpu/cpufreq/impulse/timer_slack
echo 1 > /sys/devices/system/cpu/cpufreq/impulse/powersave_bias

#Background Writeout
echo 200 > /proc/sys/vm/dirty_expire_centisecs
echo 40 > /proc/sys/vm/dirty_ratio
echo 5 > /proc/sys/vm/dirty_background_ratio
echo 10 > /proc/sys/vm/swappiness

#Misc Tweaks
echo 0 > /sys/kernel/sched/gentle_fair_sleepers
echo "0" > /sys/module/kernel/parameters/initcall_debug;
echo "0" > /sys/module/alarm_dev/parameters/debug_mask;
echo "0" > /sys/module/binder/parameters/debug_mask;
echo "0" > /sys/module/xt_qtaguid/parameters/debug_mask;
