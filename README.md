# dots
## Fonts
In `gnome-terminal` use the `DejaVu Sans Mono for Powerline | 11` font.
## Remapping keyboard keys:
Edit `/usr/share/X11/xkb/symbols/pc`
## Promptline
Use `export PROMPTLINE_ROSMASTER=true` to enable printing of the current
ROS master in the promptline.
## Spacemacs
### Install
`sudo apt-get install unifont ttf-unifonts`
Not sure if `fonts-nanum` should be installed as well.

### TODO:
* Buffer list (tabbar package)
* Icons for modes

## Cinnamon
`sudo cp cinnamon/classicSwitcher.js /usr/share/cinnamon/js/ui/appSwitcher/classicSwitcher`
Restart cinnamon.

## Nvidia

In case of any issues witht the drirvers run:
```
sudo apt-get purge nvidia*
sudo add-apt-repository ppa:graphics-drivers/ppa
sudo apt-get update
sudo apt-get install nvidia-370
```

### ASUS Backlight

Use a fork of [guillaumezin/nvidiabl](https://github.com/guillaumezin/nvidiabl):

```
wget https://github.com/madsherlock/nvidiabl/raw/master/install/deb/nvidiabl-dkms_0.88_all.deb
sudo dpkg -i nvidiabl-dkms-0.88_all.deb
rm nvidiabl-dkms_0.88_all.deb
echo "nvidiabl" >> sudo /etc/modules
```
