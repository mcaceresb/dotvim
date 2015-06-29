"-----------------------------------------------------------------------------
" Project: dotvim
" Program: mappings.vim
" Purpose: Personal mappings
" Updated: Sat 27 Jun 2015 12:10:47 AM EDT
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>

" Mappings: {{{1
"------------------------------------------------

" Navigation: Quicker/Easier Movement {{{2

" Move visual lines
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap <C-k> 6k
nnoremap <C-j> 6j
vnoremap <C-j> 6j
vnoremap <C-k> 6k

" Resize split windows
noremap <A-left> <C-w><
noremap <A-right> <C-w>>
noremap <A-up> <C-w>-
noremap <A-down> <C-w>+

" Navigate tabs/buffers
noremap <C-h> gT
noremap <C-l> gt
noremap <A-l> :bnext<CR>
noremap <A-h> :bprevious<CR>
noremap <A-Insert> :tabnew<CR>
noremap <A-Delete> :tabclose<CR>

" Navigate Splits
nnoremap gh <C-w>h
nnoremap gj <C-w>j
nnoremap gk <C-w>k
nnoremap gl <C-w>l

" Swap lines
nnoremap <A-j> :m+<CR>==
nnoremap <A-k> :m-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Open split and open in new tab
nnoremap gf <C-w>gf
nnoremap gF gf
nnoremap gs <C-w>f

" Clipboard: cut/copy/paste maps {{{2

" Select all (and copy)
nnoremap <A-a> GVgg
nnoremap <A-c> mmggyG`m

" Visual. Only need for current select
vnoremap <leader>v "+p
vnoremap <leader>c "+y
vnoremap <leader>x "+d

" Normal. Lower for word. Upper for line.
nnoremap <leader>v "+p
nnoremap <leader>V "+P
nnoremap <leader>c "+yiW
nnoremap <leader>C "+yy
nnoremap <leader>x "+diW
nnoremap <leader>X "+dd

" Insert. ,, escapes then same as normal
inoremap <leader><leader>v <Esc>"+pa
inoremap <leader><leader>V <Esc>"+Pa
inoremap <leader><leader>c <Esc>"+yiWa
inoremap <leader><leader>C <Esc>"+yya
inoremap <leader><leader>x <Esc>"+diWa
inoremap <leader><leader>X <Esc>"+dda

" Misc: Other useful mappings {{{2

" Why is vim suddenly updating folds every time I move lines?

" Markdown title
nnoremap gpt yypVr-
nnoremap gpc yyp0wv$r-

" Next and repeat
" nnoremap Q :normal n.<CR>

" Make
nnoremap <Leader>m :make<CR>

" Capitalize first letters
vnoremap <Leader>a gu:s/\v<(.)(\w*)/\u\1\L\2/g<CR>

" Remove whitespace
nmap <Leader>rs mm:%s/\s*$//g<CR>`m<ESC>cxc:noh<CR>

" Grammar abbreviations
iabbrev teh the
iabbrev nad and

" More undo
inoremap <A-z> <Esc>ua
inoremap <A-u> <C-g>u<C-u>
inoremap <A-w> <C-g>u<C-w>
inoremap <C-z> <Esc>ua
inoremap <C-u> <C-g>u<C-u>
inoremap <C-w> <C-g>u<C-w>

"Map s and q to save file and quit buffer
nnoremap <A-s> :w<CR>
inoremap <A-s> <Esc>:w<CR>a
nnoremap <A-q> :bd<CR>
inoremap <A-q> <Esc>:bd<CR>a

" Vim quickly enlarge or reduce font
nnoremap <C-Up> :let &guifont=substitute(&guifont, '\d\+', '\=(submatch(0)+1)', '')<CR> :echo &guifont<CR>
nnoremap <C-Down> :let &guifont=substitute(&guifont, '\d\+', '\=(submatch(0)-1)', '')<CR> :echo &guifont<CR>

" Quickly correct spelling
nnoremap <C-Space> hEa<C-x><C-t>
nnoremap <S-Space> a<C-x>s

" Sudo tee
cnoremap w!! w !sudo tee > /dev/null %

" Vimdiff get and put diff
nnoremap <A-g> :diffget<CR>]c
nnoremap <A-p> :diffput<CR>]c

" Precision rounding
nnoremap <leader>ro :%s/\d\+\.\d\+/\=printf('%.2f',str2float(submatch(0)))/g
vnoremap <leader>ro :s/\d\+\.\d\+/\=printf('%.2f',str2float(submatch(0)))/g

" List files, change/insert current file's directory
nnoremap <F4> i<C-R>=expand('%:p:h')<CR><ESC>
inoremap <F4> <C-R>=expand('%:p:h')<CR>

" Efficiently open and source vimrc
nnoremap <leader>el :tabedit $HOME/Documents/projects/code/latex-preamble<CR>
nnoremap <leader>ev :tabedit $MYVIMRC<CR>
nnoremap <leader>rv :source $MYVIMRC<CR>

" Keep highlighting when indenting
vnoremap > ><CR>gv
vnoremap < <<CR>gv

" Get quicker macro replay
nnoremap <F12> @q

" Search and replace
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" Map Y to yank until the end of the line
nnoremap Y y$

" Only this buffer
nnoremap <Leader>- :on<CR>

" Toggle Spell, highlight, smart indent, list
nnoremap <leader>s :set spell!<CR>
nmap <leader><CR> :noh<CR>cxc
set pastetoggle=<F5>

" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}
