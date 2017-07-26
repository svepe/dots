# dots
## Terminal colors
Run `bash base16-monokai.dark.sh` to setup the monokai gnome-terminal palette from https://github.com/chriskempson/base16-gnome-terminal

## Fonts
Install the powerline fonts at https://github.com/powerline/fonts

In `gnome-terminal` use the `DejaVu Sans Mono for Powerline | 11` font.
## Remapping keyboard keys:
Edit `/usr/share/X11/xkb/symbols/pc`
Remember to disable the CAPS-LOCK key from the Keyboard Settings menu in Cinnamon.

See https://radu.cotescu.com/remapping-keys-in-ubuntu-14.04/
## Promptline
Use `export PROMPTLINE_ROSMASTER=true` to enable printing of the current
ROS master in the promptline.
## Spacemacs
### Install
`sudo apt-get install unifont ttf-unifonts`
Not sure if `fonts-nanum` should be installed as well.

### Exports
`sudo ln -s ~/Scripts/dots/spacemacs_profile.sh /etc/profile.d/spacemacs.sh`

### Aliases
`ln -s ~/Scripts/dots/bash_aliases ~/.bash_aliases`

### Server/Client
One server should be run for GUI clients and one for terminal clients,
otherwise the terminal clients stop being rendered correctly once
a GUI client is attached. In general, to run multiple servers use:

`emacs --daemon=NAME` and `emacsclient -s NAME`

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

### Removing window decorations:

Copy the theme you want to modify in `~/.themes` and rename it. Edit the `metacity-1\metacity-theme-3.xml` by replacing the entire `<frame_geometry name="max" ...` tag with:

```
<frame_geometry name="max" has_title="false" title_scale="medium" parent="normal" rounded_top_left="false" rounded_top_right="false">
	<distance name="left_width" value="0" />
	<distance name="right_width" value="0" />
	<distance name="left_titlebar_edge" value="1"/>
	<distance name="right_titlebar_edge" value="1"/>
	<distance name="title_vertical_pad" value="0"/>
	<border name="title_border" left="0" right="0" top="0" bottom="0"/>
	<border name="button_border" left="0" right="0" top="0" bottom="0"/>
	<distance name="bottom_height" value="0" />
</frame_geometry>
```
