wget https://starship.rs/install.sh -O /tmp/install_starship.sh
sh /tmp/install_starship.sh --yes
echo 'eval "$(starship init bash)"' >> $HOME/.bashrc

# Configure starship
ln -s $(pwd)/starship.toml $HOME/.config/starship.toml
