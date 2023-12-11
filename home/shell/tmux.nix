{
  config,
  pkgs,
  ...
}: {
  programs.tmux = {
    enable = config.banana-hm.tmux.enable;
    baseIndex = 1;
    extraConfig = ''
      set -g default-terminal "xterm-kitty"

      set -g prefix C-a
      unbind C-b
      bind-key C-a send-prefix
      unbind %
      bind q kill-pane
      unbind x
      bind | split-window -h

      unbind '"'
      bind - split-window -v

      unbind r
      bind r source-file ~/.config/tmux/tmux.conf

      bind -r j resize-pane -D 5
      bind -r k resize-pane -U 5
      bind -r l resize-pane -R 5
      bind -r h resize-pane -L 5

      bind -r m resize-pane -Z

      set -g mouse on
      set -g renumber-windows on

      set -g @catppuccin_flavour 'mocha'
      set -g @catppuccin_window_left_separator "█"
      set -g @catppuccin_window_right_separator "█ "
      set -g @catppuccin_window_number_position "right"
      set -g @catppuccin_window_middle_separator "  █"

      set -g @catppuccin_window_default_fill "number"

      set -g @catppuccin_window_current_fill "number"
      set -g @catppuccin_window_current_text "#{pane_current_path}"

      set -g @catppuccin_status_modules_right "application session date_time"
      set -g @catppuccin_status_left_separator  ""
      set -g @catppuccin_status_right_separator " "
      set -g @catppuccin_status_right_separator_inverse "yes"
      set -g @catppuccin_status_fill "all"
      set -g @catppuccin_status_connect_separator "no"
    '';
    plugins = with pkgs; [
      tmuxPlugins.vim-tmux-navigator
      tmuxPlugins.catppuccin
    ];
  };
}
