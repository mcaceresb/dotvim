dotvim
======

My personal Vim distribution.

## Install

I use [Plug](https://github.com/junegunn/vim-plug) and a *ton* of plug-ins. Run `:PlugInstall` once in vim to download everything. To get started:

```bash
mkdir $HOME/lib
cd $HOME/lib
git clone github.com/mcaceresb/dotvim
export DOTVIM=$HOME/lib/dotvim

mkdir ~/.vim/
mkdir ~/.vim/session/
mkdir ~/.vim/spell/
mkdir ~/.vim/undo/

ln -s $DOTVIM/dotvimrc/vimrc ~/.vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

vim -g ~/.vimrc
:PlugInstall<CR>
:q
```

_**WARNING:**_ Change the directories from which files are sourced in `dotvimrc/vimrc` to wherever they actually are.

## Color

I keep some nice color schemes in `./colors` but they are not anything from another world. I am currently favoring [vim-colors-pencil](http://github.com/reedes/vim-colors-pencil) with some minor tweaks (see `./colors/pencil.vim`).

## Extras

I much recommend cloning [powerline's patched fonts](https://github.com/powerline/fonts/) (which provide some nice symbols to use with [airline](http://github.com/vim-airline/vim-airline) and [powerline](https://github.com/powerline/powerline)).

```bash
mkdir $HOME/lib
cd $HOME/lib
git clone https://github.com/powerline/fonts powerline-fonts
ln -s $HOME/lib/powerline-fonts $HOME/.fonts/powerline-fonts
```

You can add any additional fonts you like; for instance
```bash
ln -s $DOTVIM/lib/vim-fonts $HOME/.fonts/custom-fonts
```

I also keep some useful snippets in this repo (I am a bit lazy to clean them up and create a pull request, but I find them handy):

```bash
cp $DOTVIM/bundle/snippets/snippets/*  $HOME/.vim/plugged/snippets/snippets/  -sf
cp $DOTVIM/bundle/snippets/UltiSnips/* $HOME/.vim/plugged/snippets/UltiSnips/ -sf
```

Add `extends juliamc` and `extends pythonmc` to the top of `julia.snippets` and `python.snippets`. Last, to get [vim-instant-markdown](https://github.com/suan/vim-instant-markdown/issues) to work you also need to do
```bash
sudo pacman -S xdg-utils npm
sudo npm -g install instant-markdown-d
```

## Structure

* `./bundle` has some custom git plug-ins I wrote or modified forks of other plug-ins.
* `./colors` has some nice colorschemes.
* `./dotvimrc` has my vimrc and related files.
* `./spell` has some user-defined words.

My vimrc is split into a few parts

* `vimrc-plugins`, which is a list of plug-ins to install via `Plug`
* `vimrc-plugins-config`, which defines various plug-in related functions and mappings.
* `vimrc-lean`, defines some options I like. It also aims to be a stand-alone vimrc, as it just defines a number of settings and options, no mappings or plugins.
* `vimrc-mappings`, has all my basic mappings.
* `vimrc-functions`, has a few more complex mappings (that require custom functions).

## License

MIT
