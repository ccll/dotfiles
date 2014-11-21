OS=`uname`
if [[ "$OS" == "Darwin" ]]; then
    alias ls="ls -aFG"
    alias ll="ls -alhFG"
elif [[ "$OS" == "Linux" ]]; then
    alias ls="ls -aF --color"
    alias ll="ls -alhF --color"
fi
