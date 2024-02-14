git clone https://github.com/svepe/dots.git .dots

cd .dots

. install_tmux.sh
. install_nvim.sh
. install_starship.sh

if [[ "$1" == "--desktop" ]]; then
    . install_fonts.sh
    . install_terminal_profile.sh
fi
