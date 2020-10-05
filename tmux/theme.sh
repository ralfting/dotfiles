set -g default-terminal "screen-256color"
set -g status-interval 5

set -g status-bg "#191919"
set -g status-fg "#0000ff"

#set-window-option -g window-status-current-fg brightred #orange
#set-window-option -g window-status-current-bg "#191919"
#set-window-option -g window-status-current-attr bright

set -g status-position bottom

# Set status bar colors
set -g status-bg colour235
set-option -g status-fg white
#set-window-option -g window-status-current-bg "#191919"
#set-window-option -g window-status-current-fg red


set -g status-right "#(gitmux '#{pane_current_path}') RAM: #{ram_percentage}  CPU: #{cpu_percentage} Ping: #{ping} "
