#!/bin/sh

dir=`dirname $0`

PROFILE="Default"
if [[ $# -ge 1 ]]; then
    PROFILE=$1
fi

# set palette
gconftool-2 -s -t string /apps/gnome-terminal/profiles/$PROFILE/palette `cat $dir/colors/palette`

# set foreground to base00 and background to base3 and highlight color to
# base01
gconftool-2 -s -t string /apps/gnome-terminal/profiles/$PROFILE/background_color `cat $dir/colors/base3`
gconftool-2 -s -t string /apps/gnome-terminal/profiles/$PROFILE/foreground_color `cat $dir/colors/base00`
gconftool-2 -s -t string /apps/gnome-terminal/profiles/$PROFILE/bold_color `cat $dir/colors/base01`

# make sure the profile is set to not use theme colors
gconftool-2 -s -t bool /apps/gnome-terminal/profiles/$PROFILE/use_theme_colors false
