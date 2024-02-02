{pkgs, ...}:
pkgs.writeShellScriptBin "cava_waybar" ''
  set -e

  bar="▁▂▃▄▅▆▇█"
  dict="s/;//g;"
  i=0
  while [ $i -lt ''${#bar} ]
  do
      dict="''${dict}s/$i/''${bar:$i:1}/g;"
      i=$((i=i+1))
  done

  pipe="/tmp/cava.fifo"
  if [ -p $pipe ]; then
      unlink $pipe
  fi
  mkfifo $pipe

  config_file="/tmp/polybar_cava_config"
  echo "
  [general]
  bars = 12
  framerate = 60

  [output]
  method = raw
  raw_target = $pipe
  data_format = ascii
  ascii_max_range = 7
  " > $config_file

  cava -p $config_file &

  while read -r cmd; do
      echo $cmd | sed $dict
  done < $pipe
''
