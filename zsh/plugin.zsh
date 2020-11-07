# zplug
if [[ ! -d ~/.zplug ]];then
  git clone https://github.com/zplug/zplug ~/.zplug
fi

source ~/.zplug/init.zsh

zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "b4b4r07/enhancd", use:init.sh

ls ~/dotfiles/zsh/plugin/*.zsh >/dev/null 2>&1
if [ ! $? -ne 0 ]; then
  for file in ~/dotfiles/zsh/plugin/*.zsh; do
    source $file
  done
fi

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load
