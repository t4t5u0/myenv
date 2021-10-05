
if [ "$(uname)" == 'Dawrin' ]; then
    brew install starship
fi



mkdir -p $HOME/.config 

MY_PWD="$(pwd)"

echo $MY_PWD

cd $HOME/.config
ln -sf $MY_PWD/starship.toml starship.toml
cd $MY_PWD

echo 'done'