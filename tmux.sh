#!/usr/bin/env sh

# Config
BASE="`pwd`"
APP=`basename $BASE`

# Starting new tmux server
tmux start-server

# Starting new tmux session
tmux new-session -d -s $APP

# Setup windows
tmux new-window -t $APP:0 -k -n console "bundle exec rails c"
tmux new-window -t $APP:1 -n server "bundle exec rails s"
tmux new-window -t $APP:2 -n zsh
tmux new-window -t $APP:3 -n vim "vim"

tmux attach-session -t $APP
