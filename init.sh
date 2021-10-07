

MY_PWD="$(pwd)"

if [ "$(uname)" == 'Dawrin' ]; then
    brew install starship
    brew install gh
    brew install exa
fi

mkdir -p $HOME/.config 


ln -sf $MY_PWD/starship.toml $HOME/.config/starship.toml

ln -sf $MY_PWD/dotfile/zsh/.zshrc $HOME/.zshrc
ln -sf $MY_PWD/dotfile/zsh/.zshenv $HOME/.zshenv
ln -sf $MY_PWD/dotfile/zsh/.zsh $HOME/.zsh
ln -sf $MY_PWD/dotfile/zsh/.dir_colors $HOME/.dir_colors


mkdir font 
cd font

curl -JLOs https://github.com/miiton/Cica/releases/download/v5.0.2/Cica_v5.0.2_with_emoji.zip

unzip -q ./*.zip

if [ "$(uname)" == 'Darwin' ]; then
  cp -f ./*.ttf ~/Library/Fonts
fi

fc-cache -vf

cd ..
rm -rf font

echo "TerminalのfontをCicaに変更して下さい"
