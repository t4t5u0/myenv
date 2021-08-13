cp dotfile/.zsh dotfile/.zshrc dotfile/.zshenv ~/ -rf && \
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | sh && \
source ~/.zshrc
