#!/usr/bin/bash

function has() {
    type "$1" &>/dev/null
}

function git_clone() {
    if has "git"; then
        git clone --recursive "$1" "$2"

    elif has "curl" || has "wget"; then
        tarball="$GITHUB_URL/archive/master.tar.gz"

        mkdir -p "$2"
        if has "curl"; then
            curl -L "$tarball"

        elif has "wget"; then
            wget -O - "$tarball"

        fi | tar zxvf -C "$2" --strip-components=1

    else
        echo "git or curl or wget required"
        exit 1;
    fi
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
echo ">> complided tmux-256color"

########
# pure #
########
git_clone https://github.com/sindresorhus/pure.git "$HOME/.zsh/pure"
echo ">> installed pure prompt"

############
# dotfiles #
############

DOTPATH=$HOME/dotfiles
GITHUB_URL="https://github.com/pyonk/dotfiles"

git_clone "$GITHUB_URL" "$DOTPATH"

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

echo ">> installed dotfiles"


#######
# tpm #
#######
git_clone "https://github.com/tmux-plugins/tpm" $HOME/.config/tmux/plugins/tpm
echo ">> installed tpm"
