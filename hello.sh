#!/bin/bash

read -p "[Yy/*] change keyboard map to EU? " kbmap

case $kbmap in
    [Yy] ) setxkbmap eu;
esac

read -p "[Yy/*] open sublime? " sublime

read -p "[Yy/*] open chrome? " chrome

read -p "open ide? [Aa]ndroid [Pp]ycharm. " ide

#read -p "open VM? [Kk]ali [Dd]ebian [Ww]indows. " vbox

tmux -2 new-session -d -s hello

# Setup 4 panels
#   0 1
#   2 3

tmux split-window -v
tmux split-window -h
tmux select-pane -t 0
tmux split-window -h

# Setup
############################## pane 1
tmux select-pane -t 1

case $sublime in
    [Yy] ) tmux send-keys "subl" C-m;
esac

case $chrome in
	[Yy] ) tmux send-keys "google-chrome 1> /dev/null 2> /dev/null &" C-m;
esac

tmux send-keys "htop" C-m;

############################# pane 0
case $ide in
    [Aa] ) tmux select-pane -t 0 ;tmux send-keys "~/Downloads/android-studio/bin/studio.sh" C-m ;;
    [Pp] ) tmux select-pane -t 0 ;tmux send-keys "~/pycharm-community-2017.3.1/bin/pycharm.sh" C-m ;;
esac

tmux a -t hello