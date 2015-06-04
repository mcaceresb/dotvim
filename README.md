## dotvim (:

My personal Vim distribution.

## Quickstart (:

I use [NeoBundle](https://github.com/Shougo/neobundle.vim) and a *ton* of plug-ins. All the packages will install automatically once Vim starts. Do this to get started:
```sh
export DOTVIM=$HOME/Documents/projects/code/dotvim
mkdir ~/.vim/
mkdir ~/.vim/bundle/
mkdir ~/.vim/session/
mkdir ~/.vim/spell/
mkdir ~/.vim/undo/
cp $DOTVIM/fonts/* ~/.fonts/
ln -s $DOTVIM/dotvimrc/vimrc ~/.vimrc
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
mv ~/.vim/bundle/neobundle.vim ~/.vim/bundle/neobundle
```

You should edit the path `$HOME/Documents/projects/code/dotvim` here *and* in `./vimrc` if you copied this repository to a different directory (used for dictionaries, thesaurus, source). Then start `vim` and `NeoBundle` should install all the packages. Once they have all installed, run
```sh
ln -s $DOTVIM/bundle/latex-suite-abridged/ ~/.vim/bundle/latex-suite-abridged
cp $DOTVIM/bundle/snippets/snippets/* ~/.vim/bundle/snippets/snippets/
cp $DOTVIM/bundle/snippets/UltiSnips/* ~/.vim/bundle/snippets/UltiSnips/ -sf
cp $DOTVIM/colors/* ~/.vim/bundle/colorschemes/colors/ -sf
```

Why? Because I'm lazy and I can't be bothered to figure out how to fork these projects for only a handful of files. Lastly, to get `vim-instant-markdown` to work you also need to do
```bash
sudo apt-get install xdg-utils
sudo npm -g install instant-markdown-d
```

## Structure (:

* `./bundle` has some specific files I have modified for bundles that I install. Currently houses my mangled version of `vim-latex` as well as (most of) my custom snippets.
* `./colors` has some colorschemes I actually use.
* `./dotvimrc` has my vimrc and related files.
* `./fonts` has some monospaced fonts I like.
* `./spell` has dictionaries from [Moby](http://icon.shef.ac.uk/Moby/) and [WordNet](http://wordnet.princeton.edu/), csv thesaurus, and user-defined words.
* `./session` is just for show.
* `./undo` is just for show.

## TODO (:

* Make folder naming automatic (currently it is hard-coded to `$HOME/Documents/projects/code/dotvim` in this `README.md` and in my `vimrc`)
* Figure out a better way of keeping your custom snippets and colorschemes
* Make python snippets
* Make Tabular mappings work (currently not mapping)
* Make copy/paste-able into `~/.vim`?
* Edit rplugin/common_global.vim to add `--profile white` to `konsole`?
* Vim in `konsole`, not just `vim -g`?

## Issues (:

* While all the plug-ins seem to work as expected, I get these errors upon running `vim -g`
```
Error detected while processing dotvimrc/plugins.vim:
line   88:
E117: Unknown function: expand_region#custom_text_objects
line  176:
E117: Unknown function: neocomplete#custom#source
Error detected while processing bundle/textobj-line/plugin/textobj/line.vim:
line   37:
E117: Unknown function: textobj#user#plugin
```

## License (:

Figure this out.

