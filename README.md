# dots
## Terminal colors
Run `bash base16-monokai.dark.sh` to setup the monokai gnome-terminal palette from https://github.com/chriskempson/base16-gnome-terminal

## Fonts
Install the powerline fonts at https://github.com/powerline/fonts

In `gnome-terminal` use the `DejaVu Sans Mono for Powerline | 11` or `Ubuntu Mono derivative Powerline` font.

If in `spacemacs` the buffer shifts upon bracket highlighting (e.g. in LISP mode)
then the system uses the bold version of the `DejaVu Sans for Powerline font`
and so you should remove the following files from `~/.local/share/fonts`:
```
rm DejaVu Sans Mono Bold for Powerline.ttf
rm DejaVu Sans Mono Bold Oblique for Powerline.ttf
rm DejaVu Sans Mono Oblique for Powerline.ttf
fc-cache -f -v
```
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

Set up the following start up commands:

`emacs --daemon=gui  # smv`
`emacs --daemon=term # smc`

Put a 1 second delay before launcing the second one, otherwise there might be a racing condition which causes multiple servers to be launched, which do not work anyway.

## Safeeyes
`ln -s /home/svetlin/Scripts/dots/safeeyes.json /home/svetlin/.config/safeeyes/`

### TODO:
* Buffer list (tabbar package)
* Icons for modes

## Cinnamon
`sudo cp cinnamon/classicSwitcher.js /usr/share/cinnamon/js/ui/appSwitcher/classicSwitcher`
Restart cinnamon.

### Customising
This file `/usr/share/cinnamon/theme/cinnamon.css` contains all possible CSS tags, so always consult with it. More info about cinnamon is available [here](http://caverdan.com/Mint18Themes/startpage.html).

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

## XPS15

### Fix freezing on shutdown:

`sudo ubuntu-drivers autoinstall`

this will install nvidia drivers as well, however you should update them by adding the graphics PPA and installing/upgrading to the latest driver version (tested with nvidia-387).

### Fix prime-select
Apparently, prime-select has a bug so use this version:
```
cd /usr/bin/
sudo mv prime-select prime-select.bak
sudo wget https://raw.githubusercontent.com/C11235/nvidia-prime-bugfix/master/prime-select
sudo chmod 755 prime-select
```

### Fix booting with iGPU
Info [here](https://github.com/Bumblebee-Project/bbswitch/issues/148/#issuecomment-304726979) and instructions [here](https://https://www.reddit.com/r/Dell/comments/63cavx/fixed_nvidia_1050_freezing_in_ubuntu_linux/).

In short, open `/etc/default/grub` and edit the line
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"
```
by adding `acpi_rev_override=1` to the list, so it becomes
```
GRUB_CMDLINE_LINUX_DEFAULT="quiet splash acpi_rev_override=1"
```
Then run
```
sudo update-grub
sudo update-grub2
```

### Switching GPUs

Use PRIME Indicator Plus (should be in 18.04 repos) from [here](https://github.com/andrebrait/prime-indicator).

### Turn off bluetooth on startup

```
gsettings set org.blueman.plugins.powermanager auto-power-on false
```
