dotvim
======

My personal Vim distribution.

## Quickstart

I use [Bundle](https://github.com/VundleVim/Vundle.vim) and a *ton* of plug-ins. All the packages will install automatically once Vim starts. Do this to get started:
```bash
export DOTVIM=$HOME/Documents/code/dotvim
mkdir ~/.vim/
mkdir ~/.vim/bundle/
mkdir ~/.vim/session/
mkdir ~/.vim/spell/
mkdir ~/.vim/undo/
cp $DOTVIM/fonts/* ~/.fonts/
ln -s $DOTVIM/dotvimrc/vimrc ~/.vimrc
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer --omnisharp-completer --tern-completer
```

You should edit the path `$HOME/Documents/projects/code/dotvim` here *and* in `./vimrc` if you copied this repository to a different directory (used for dictionaries, thesaurus, source). Then start `vim` and `NeoBundle` should install all the packages. Once they have all installed, run
```bash
cp $DOTVIM/bundle/snippets/snippets/* ~/.vim/bundle/snippets/snippets/
cp $DOTVIM/bundle/snippets/UltiSnips/* ~/.vim/bundle/snippets/UltiSnips/ -sf
cp $DOTVIM/colors/* ~/.vim/bundle/colorschemes/colors/ -sf
```

Why? Because I'm lazy and I can't be bothered to figure out how to fork these projects for only a handful of files. Lastly, to get `vim-instant-markdown` to work you also need to do
```bash
sudo apt-get install xdg-utils npm
sudo npm -g install instant-markdown-d
```

## Structure

* `./bundle` has some specific files I have modified for bundles that I install. Currently houses my mangled version of `vim-latex` as well as (most of) my custom snippets.
* `./colors` has some colorschemes I actually use.
* `./dotvimrc` has my vimrc and related files.
* `./fonts` has some monospaced fonts I like.
* `./spell` has dictionaries (e.g. from [Moby](http://icon.shef.ac.uk/Moby/) and [WordNet](http://wordnet.princeton.edu/), csv thesaurus, and user-defined words).
* `./session` is just for show.
* `./undo` is just for show.

## TODO

* Edit rplugin/common_global.vim to add `--profile white` to `konsole`
* Vim in `konsole`, not just `vim -g`

## MIT License

Personal vim distribution
Copyright © 2016 CausalMind

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included
in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
