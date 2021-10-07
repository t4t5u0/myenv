MY_PWD="$(pwd)"

if [ "$(uname)" == 'Dawrin' ]; then
    brew install starship
fi

mkdir -p $HOME/.config 

cd $HOME/.config
ln -sf $MY_PWD/starship.toml starship.toml
cd $MY_PWD

ln -sf $MY_PWD/dotfile/zsh/.zshrc $HOME/.zshrc
ln -sf $MY_PWD/dotfile/zsh/.zshenv $HOME/.zshenv
ln -sf $MY_PWD/dotfile/zsh/.zsh $HOME/.zsh
ln -sf $MY_PWD/dotfile/zsh/.dir_colors $HOME/.dir_colors
