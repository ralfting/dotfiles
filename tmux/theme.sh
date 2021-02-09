set -g default-terminal "screen-256color"
set -g status-interval 5

set -g status-bg "#191919"
set -g status-fg "#0000ff"

set -g status-position bottom

# Set status bar colors
set -g status-bg colour235
set-option -g status-fg white

set -g status-right "RAM: #{ram_percentage}  CPU: #{cpu_percentage}"
