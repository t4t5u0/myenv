cp dotfile/zsh/* ~/ -rf && \
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | sh && \
source ~/.zshrc