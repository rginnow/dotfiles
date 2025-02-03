#! /bin/sh

directoryx="$(dirname -- $(readlink -fn -- "$0"; echo x))"
directory="${directoryx%x}"

# memory
mem_size=$(system_profiler SPHardwareDataType | grep "Memory" | awk '{print $2$3}')
mem_bytes=$(sysctl -n hw.memsize) # total memory in bytes

# cpu
cpu_brand=$(sysctl -n machdep.cpu.brand_string)
cpus_virtual=`bc -l <<< "$(sysctl -n hw.ncpu) * 100"` # number of CPUs * 100

# software
sw_ver=$(sw_vers | grep "ProductVersion" | awk '{print $2}')
kernel_name=$(sysctl -n kern.ostype)
kernel_ver=$(sysctl -n kern.osrelease)

function show_disk_info() {
    df_output=$(df / | sed '1d' | awk ' /^\/dev\/disk*/ {
        size_byte = $2 * 512            # df uses 512 byte blocks
        avail_byte = $4 * 512
        total_size_gb = size_byte / 1000000000
        total_avail_gb = avail_byte / 1000000000

        printf "  Storage: %.1f GB free of %.1f GB\n", total_avail_gb, total_size_gb
    }')
    printf "$df_output\n\n"
}

function show_system_info() {
    uptime=`uptime | sed -E 's/.*(up.*), [[:digit:]]+ user.*/\1/'`
    printf "  Uptime.: $uptime\n"
    # printf "  Distro.: macOS $sw_ver\n"
    # printf "  Kernel.: $kernel_name $kernel_ver\n"
    printf "  CPU....: $cpu_brand\n"
    printf "  RAM....: $mem_size\n"
    show_disk_info
}

function get_memory_usage() {
    memory=`ps -A -o %mem | awk '{s+=$1} END {print s}'`
    pct=`bc -l <<< "${memory}/${mem_size}"`
    printf "RAM usage: "
    printf %.2f `echo "${pct}*100" | bc -l`
    echo "%"
    print_visual_bar $pct
}

function get_cpu_usage() {
    usage=`ps -A -o %cpu | awk '{s+=$1} END {print s}'`
    pct=`bc -l <<< "${usage}/${cpus_virtual}"`
    printf "CPU usage: "
    printf %.2f `echo "${pct}*100" | bc -l`
    echo "%"
    print_visual_bar $pct
}

function print_visual_bar() {
    bar="================================================="
    # red='\033[0;31m'
    red='\e[33m'
    nc='\033[0m'
    count=${#bar}
    index=`bc -l <<< "${pct} * ${count}"`
    index=`printf "%.0f" "${index}"`
    printf "[${red}${bar:0:$index}${nc}${bar:$index:$count}]\n"
}

# ASCII Art
month_number=$(date +%m)
day_number=$(date +%d)
artii $(whoami) | lolcat --truecolor --seed=$day_number --spread=$month_number
printf "\n"

# Colors
printf "         "
for color in {41..46} ; do
	# Display the color
	printf "\e[${color}m   "
done
printf "\e[0m \n\n"

#curl -s "https://wttr.in/palm+coast?u0"
#printf "\n"

# System Information Section
printf "System Info\n"
echo "----------------------------------------"
show_system_info

# Current Usage Section
get_memory_usage
get_cpu_usage
printf "\n"
