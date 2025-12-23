if status is-interactive
    # Commands to run in interactive sessions can go here
end

function tma
  if count $argv > /dev/null
    tmux attach -t $argv[1]
  else
    tmux attach
  end
end

function add_to_path_unique
  if not contains $argv[1] $PATH
    set -gx PATH $argv[1] $PATH
  end
end

add_to_path_unique $HOME/.dot/scripts
add_to_path_unique $HOME/scripts
add_to_path_unique $HOME/go/bin
add_to_path_unique /usr/local/go/bin

set TERM xterm-256color
set fish_term24bit 0

alias x='./x.py'

add_to_path_unique ~/.local/bin
