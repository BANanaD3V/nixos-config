#! /usr/bin/env bash

set -e

pid_file="cavash.pid"

# ensure only one instance of script is running
#if [ -f "$pid_file" ] && ps -p $(cat "$pid_file") > /dev/null
#then
    # another instance of this script is running
    #exit #change exit to connecting to another instance of the script
#fi

# write script's PID to pid-file
printf "$$" > "$pid_file"

bar="▁▂▃▄▅▆▇█"
dict="s/;//g;"

# creating "dictionary" to replace char with bar
i=0
while [ $i -lt ${#bar} ]
do
    dict="${dict}s/$i/${bar:$i:1}/g;"
    i=$((i=i+1))
done

# make sure to clean pipe
pipe="/tmp/cava.fifo"
if [ -p $pipe ]; then
    unlink $pipe
fi
mkfifo $pipe

# write cava config
config_file="/tmp/polybar_cava_config"
echo "
[general]
bars = 12

[output]
method = raw
raw_target = $pipe
data_format = ascii
ascii_max_range = 7
" > $config_file

# run cava in the background
cava -p $config_file &

# reading data from fifo
while read -r cmd; do
    echo $cmd | sed $dict
done < $pipe
