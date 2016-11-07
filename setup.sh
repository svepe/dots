#/bin/sh	

# TODO:
# * Add dots path instead of hardcoding ~/Scripts/dots
# * Add neovim installation
# * Add font installation

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

# Install emacs
if [ ! -f /usr/local/bin/emacs ]; then
  wget http://ftp.gnu.org/gnu/emacs/emacs-24.5.tar.xz /tmp/emacs-24.5.tar.xz
  tar -xf /tmp/emacs-24.5.tar.* --directory /tmp/
  cd /tmp/emacs-24.5
  ./configure
  make -j4
  sudo make install
fi

# Install spacemacs
git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
ln -s ~/Scripts/dots/spacemacs       ~/.spacemacs
sudo ln -s /usr/local/bin/emacs /usr/local/bin/spacemacs

git clone https://github.com/VundleVim/Vundle.vim.git ~/.config/nvim/bundle/Vundle.vim

echo "Setup successfull. Now run PluginInstall within nvim."
