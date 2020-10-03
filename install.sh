#!/usr/bin/bash

function has() {
    type "$1" &>/dev/null
}

#################
# tmux-256color #
#################

TMUX_TERMINFO_URL="https://github.com/tmux/tmux/files/1725937/tmux-256color.terminfo.txt"
TMUX_TERMINFO_TXT="tmux-256color.terminfo.txt"

if has "curl"; then
  curl -LO "$TMUX_TERMINFO_URL"
elif has "wget"; then
  wget -O - "$TMUX_TERMINFO_URL" > "$TMUX_TERMINFO_TXT"
fi

tic "$TMUX_TERMINFO_TXT"
echo "complided tmux-256color"

########
# pure #
########
mkdir -p "$HOME/.zsh"
git clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
echo "installed pure prompt"

############
# dotfiles #
############

DOTPATH=$HOME/dotfiles
GITHUB_URL="https://github.com/pyonk/dotfiles"

if has "git"; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"

elif has "curl" || has "wget"; then
    tarball="$GITHUB_URL/archive/master.tar.gz"

    if has "curl"; then
        curl -L "$tarball"

    elif has "wget"; then
        wget -O - "$tarball"

    fi | tar zxv

    mv -f dotfiles-master "$DOTPATH"

else
    echo "curl or wget required"
    exit 1;
fi

cd $DOTPATH
if [ $? -ne 0 ]; then
    echo "not found: $DOTPATH"
    exit 1;
fi

for f in .??*
do
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue

    ln -snfv "$DOTPATH/$f" "$HOME/$f"
done

echo "installed!"
