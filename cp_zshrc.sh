MY_PWD="$(pwd)"

echo $MY_PWD

# cd $HOME

ln -sfv $MY_PWD/dotfile/zsh/.zshrc $HOME/.zshrc
ln -sfv $MY_PWD/dotfile/zsh/.zshenv $HOME/.zshenv
ln -sfv $MY_PWD/dotfile/zsh/.zsh $HOME/.zsh
ln -sfv $MY_PWD/dotfile/zsh/.dir_colors $HOME/.dir_colors

# cd $MY_PWDß