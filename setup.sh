#/bin/sh	

# promptline
ln -s ~/Scripts/dots/promptline.sh   ~/.promptline.sh 

# tmux
ln -s ~/Scripts/dots/tmux.conf       ~/.tmux.conf
ln -s ~/Scripts/dots/tmuxline.conf   ~/.tmuxline.conf

# nvim
if [ ! -d "~/.config/nvim" ]; then
  mkdir ~/.config/nvim
fi
ln -s ~/Scripts/dots/init.vim        ~/.config/nvim/init.vim

if [ ! -d "~/.config/nvim/colors" ]; then
  mkdir ~/.config/nvim/colors
fi
cp ~/Scripts/dots/monokai.vim        ~/.config/nvim/colors/

if [ ! -d "~/.config/nvim/bundle" ]; then
  mkdir ~/.config/nvim/bundle
fi

# spacemacs
ln -s ~/Scripts/dots/spacemacs       ~/.spacemacs

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

echo "Setup successfull. Now run PluginInstall within nvim."
