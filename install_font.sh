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
