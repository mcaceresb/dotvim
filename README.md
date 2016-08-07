dotvim
======

My personal Vim distribution.

## Install

I use [Plug](https://github.com/junegunn/vim-plug) and a *ton* of plug-ins. Run `:PlugInstall` once in vim to download everything. To get started:

```bash
export DOTVIM=$HOME/Documents/code/dotvim
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

I keep some nice color schemes in `$DOTVIM/colors` but they are not anything from another world. I am currently favoring [vim-colors-pencil](http://github.com/reedes/vim-colors-pencil) with some minor tweaks (see `$DOTVIM/colors/pencil.vim`).

## Extras

I keep some nice monospaced fonts in this repo, but I would much recommend cloning this repository of [powerline-patched fonts](https://github.com/powerline/fonts/) (which provides some nice symbols to use with [airline](http://github.com/vim-airline/vim-airline) and [powerline](https://github.com/powerline/powerline)).

```bash
git clone https://github.com/powerline/fonts powerline-fonts
ln -s ~/.fonts/powerline-fonts powerline-fonts
ln -s ~/.fonts/custom-fonts $DOTVIM/fonts
```

I also keep some useful snippets in this repo (I am a bit lazy to clean them up and create a pull request, but I find them handy):

```bash
cp $DOTVIM/bundle/snippets/snippets/* ~/.vim/plugged/snippets/snippets/ -sf
cp $DOTVIM/bundle/snippets/UltiSnips/* ~/.vim/plugged/snippets/UltiSnips/ -sf
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
* `./fonts` has some monospaced fonts I like.
* `./spell` has dictionaries (e.g. from [Moby](http://icon.shef.ac.uk/Moby/) and [WordNet](http://wordnet.princeton.edu/), csv thesaurus, and user-defined words).

My vimrc is split into a few parts

* `vimrc-plugins`, which is a list of plug-ins to install via `Plug`
* `vimrc-plugins-config`, which defines various plug-in related functions and mappings.
* `vimrc-lean`, defines some options I like. It also aims to be a stand-alone vimrc, as it just defines a number of settings and options, no mappings or plugins.
* `vimrc-mappings`, has all my basic mappings.
* `vimrc-functions`, has a few more complex mappings (that require custom functions).

## License

MIT
