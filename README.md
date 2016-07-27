dotvim
======

My personal Vim distribution.

## Install

I use [Plug](https://github.com/junegunn/vim-plug) and a *ton* of plug-ins. Run `:PlugInstall` once in vim to download everything. To get started:

```bash
export DOTVIM=$HOME/dotvim
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

I also keep some nice color schemes in `$DOTVIM/colors` but they are not anything from another world. I am currently trying out (and mostly enjoying) [vim-colors-pencil](http://github.com/reedes/vim-colors-pencil). With some minor tweaks (see `$DOTVIM/colors/pencil.vim`) it looks really nice to me.

Last, some things are not too smooth over SSH if you're not using GVim. I I use the [vim-alt-mapppings](https://github.com/vim-utils/vim-alt-mappings) plugin for alt key mappings, for instance. I also set vim to use a 256 color terminal, which is unnecessary in GVim.

## Structure

* `./bundle` has some specific files I have modified for bundles that I install. Currently houses my mangled version of `vim-latex` as well as (most of) my custom snippets.
* `./colors` has some colorschemes I actually use.
* `./dotvimrc` has my vimrc and related files.
* `./fonts` has some monospaced fonts I like.

My vimrc is split into a few parts

* `vimrc-plugins`, which is a list of plug-ins to install via `Plug`
* `vimrc-plugins-config`, which defines various plug-in related functions and mappings.
* `vimrc-lean`, defines some options I like. It also aims to be a stand-alone vimrc, as it just defines a number of settings and options, no mappings or plugins.
* `vimrc-mappings`, has all my basic mappings.
* `vimrc-functions`, has a few more complex mappings (that require custom functions).

## License

MIT
