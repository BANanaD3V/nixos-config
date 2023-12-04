{pkgs, ...}:
pkgs.writeShellScriptBin "uploader" ''
  file=$(find $HOME -type f | rofi -dmenu -config ~/.config/rofi/configs/clipboard.rasi -p '>')
  url=$(curl -F "file=@$file" -Fsecret= 0x0.banana.is-cool.dev)
  wl-copy $url
  notify-send "File has been uploaded
  The url is $url"
''
