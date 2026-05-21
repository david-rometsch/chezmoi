#!/usr/bin/env zsh

# change the statusbar colors!
if grep -q "#74c7ec" /home/david/.config/i3blocks/config; then
  sed -i 's/#74c7ec/#ff2222/g' /home/david/.config/i3blocks/config 
  echo "reblaced blue by red"
else  grep -q "#ff2222" /home/david/.config/i3blocks/config
  sed -i 's/#ff2222/#74c7ec/g' /home/david/.config/i3blocks/config 
  echo "replaced red by blue"
fi
#/usr/bin/i3-msg restart

