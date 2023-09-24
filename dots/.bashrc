# Sample .bashrc for SUSE Linux
# Copyright (c) SUSE Software Solutions Germany GmbH

# There are 3 different types of shells in bash: the login shell, normal shell
# and interactive shell. Login shells read ~/.profile and interactive shells
# read ~/.bashrc; in our setup, /etc/profile sources ~/.bashrc - thus all
# settings made here will also take effect in a login shell.
#
# NOTE: It is recommended to make language settings in ~/.profile rather than
# here, since multilingual X sessions would not work properly if LANG is over-
# ridden in every subshell.

test -s ~/.alias && . ~/.alias || true
[ -r /home/banana/.byobu/prompt ] && . /home/banana/.byobu/prompt   #byobu-prompt#
export PATH=$PATH:~/.spoof-dpi/bin
export MANGOHUD_CONFIG=fps,cpu_load,ram,vram,swap,engine_version,version
#if [[ $(ps --no-header --pid=$PPID --format=comm) != "fish" && -z ${BASH_EXECUTION_STRING} ]]
#then
#	shopt -q login_shell && LOGIN_OPTION='--login' || LOGIN_OPTION=''
#	exec fish $LOGIN_OPTION
#fi
exec zsh
