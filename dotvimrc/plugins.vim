" ----------------------------------------------------------------------------
" Project: dotvim
" Program: plugins.vim
" Purpose: Various plugin options and customizations
" Updated: Sub 28 Jun 2015 12:18:47 AM EDT
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>

" Plug-ins and file-specific {{{1
" -----------------------------------------------

" Airline: Awesome status indicator {{{2
let g:airline_theme = 'sol'
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'

" Make the symbols pretty
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇ '
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" CtrlP: Fast file navitation {{{2
let g:ctrlp_follow_symlinks = 1
nnoremap <C-g> :CtrlPBuffer<CR>

" Undo: Visualize undo history {{{2
nnoremap <F11> :UndotreeToggle<CR>

" NERDTree: Nice file explorer for Vim {{{2
nnoremap <F10> :NERDTreeToggle<CR>

" Gigutter: Git file changes visualization {{{2
let g:gitgutter_enabled = 0
let g:gitgutter_signs = 0
let g:gitgutter_highlight_lines = 0

" Screen: Vim interface with Gnu-Screen {{{2
let g:ScreenShellTerminal = 'konsole'
nmap <LocalLeader>d V:ScreenSend<CR>j
vmap <LocalLeader>d :ScreenSend<CR>j

" Startify: Nice start screen {{{2
let g:startify_session_dir = '~/.vim/session'
let g:startify_list_order = [
            \ ['    My most recently used files:'],
            \ 'files',
            \ ['    My most recently used files in the current directory:'],
            \ 'dir',
            \ ['    Bookmarks:'],
            \ 'bookmarks',
            \ ['    Sessions:'],
            \ 'sessions',
            \ ]
let g:startify_bookmarks = [
            \ '~/.vim',
            \ '$PROJECTS'
            \]
let g:startify_session_persistence = 1

" Tabular: Nice alignment features {{{2
vnoremap <leader>at :Tabularize /&<CR>
nnoremap <leader>at :Tabularize /&<CR>

vnoremap <leader>a# :Tabularize /#/l1r1<CR>
vnoremap <leader>a% :Tabularize /%/l1r1<CR>
vnoremap <leader>a& :Tabularize /&/l1r1<CR>
vnoremap <leader>a* :Tabularize /*/l1r1<CR>
vnoremap <leader>a= :Tabularize /=/l1r1<CR>
vnoremap <leader>a- :Tabularize /-/l1r1<CR>
vnoremap <leader>a, :Tabularize /,/l1r1<CR>
vnoremap <leader>a" :Tabularize /"/l1r1<CR>
vnoremap <leader>a: :Tabularize /:/l1r1<CR>
vnoremap <leader>a$ :Tabularize /$/l1r1<CR>
vnoremap <leader>a/ :Tabularize /\/\/\+/l1r1<CR>

nnoremap <leader>a# mm:Tabularize /#/l1r1<CR>`m
nnoremap <leader>a% mm:Tabularize /%/l1r1<CR>`m
nnoremap <leader>a& mm:Tabularize /&/l1r1<CR>`m
nnoremap <leader>a* mm:Tabularize /*/l1r1<CR>`m
nnoremap <leader>a= mm:Tabularize /=/l1r1<CR>`m
nnoremap <leader>a- mm:Tabularize /-/l1r1<CR>`m
nnoremap <leader>a, mm:Tabularize /,/l1r1<CR>`m
nnoremap <leader>a" mm:Tabularize /"/l1r1<CR>`m
nnoremap <leader>a: mm:Tabularize /:/l1r1<CR>`m
nnoremap <leader>a$ mm:Tabularize /$/l1r1<CR>`m
nnoremap <leader>a/ mm:Tabularize /\/\/\+/l1r1<CR>`m

vnoremap <leader>z# :Tabularize /#\zs/l0r1<CR>
vnoremap <leader>z% :Tabularize /%\zs/l0r1<CR>
vnoremap <leader>z& :Tabularize /&\zs/l0r1<CR>
vnoremap <leader>z* :Tabularize /*\zs/l0r1<CR>
vnoremap <leader>z= :Tabularize /=\zs/l0r1<CR>
vnoremap <leader>z- :Tabularize /-\zs/l0r1<CR>
vnoremap <leader>z, :Tabularize /,\zs/l0r1<CR>
vnoremap <leader>z" :Tabularize /"\zs/l0r1<CR>
vnoremap <leader>z: :Tabularize /:\zs/l0r1<CR>
vnoremap <leader>z$ :Tabularize /$\zs/l0r1<CR>
vnoremap <leader>z/ :Tabularize /\/\/\+\zs/l0r1<CR>

nnoremap <leader>z# mm:Tabularize /#\zs/l0r1<CR>`m
nnoremap <leader>z% mm:Tabularize /%\zs/l0r1<CR>`m
nnoremap <leader>z& mm:Tabularize /&\zs/l0r1<CR>`m
nnoremap <leader>z* mm:Tabularize /*\zs/l0r1<CR>`m
nnoremap <leader>z= mm:Tabularize /=\zs/l0r1<CR>`m
nnoremap <leader>z- mm:Tabularize /-\zs/l0r1<CR>`m
nnoremap <leader>z, mm:Tabularize /,\zs/l0r1<CR>`m
nnoremap <leader>z" mm:Tabularize /"\zs/l0r1<CR>`m
nnoremap <leader>z: mm:Tabularize /:\zs/l0r1<CR>`m
nnoremap <leader>z$ mm:Tabularize /$\zs/l0r1<CR>`m
nnoremap <leader>z/ mm:Tabularize /\/\/\+\zs/l0r1<CR>`m

" UltiSnips: Fairly cool snippet plugin {{{2
let g:UltiSnipsUsePythonVersion = 2
let g:UltiSnipsExpandTrigger = "<s-space>"
let g:ultisnips_python_style = "google"
let g:UltiSnipsSnippetsDir = "~/.vim/bundle/snippets/UltiSnips"

" IndentLines: Indentation Guides on Demand {{{

let g:indentLine_myToggle = 0
let g:indentLine_enabled  = 0
let g:indentLine_color_gui = '#A4E57E'
let g:indentLine_char = '┋'
let g:indentLine_char = '¦'

let g:indent_guides_color_change_percent = 50
let g:indent_guides_start_level = 1
let g:indent_guides_guide_size  = 1
let g:indent_guides_auto_colors = 0
" let g:indent_guides_soft_pattern = ' '
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#EDEDED
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#F1F1F1

" YouCompleteMe: Language and Auto-Completion {{{2

" let g:ycm_min_num_of_chars_for_completion = 2
" let g:ycm_min_num_identifier_candidate_chars = 0
" let g:ycm_auto_trigger = 1
" let g:ycm_path_to_python_interpreter = ''
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_complete_in_strings = 1
let g:ycm_complete_in_comments = 1
let g:ycm_collect_identifiers_from_comments_and_strings = 1
let g:ycm_autoclose_preview_window_after_completion = 1
map <leader>g :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_filetype_blacklist = {
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'unite' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ }

" Zeavim: Zeal integration for vim {{{

" let g:investigate_command_for_python = '/usr/bin/zeal --query ^s'
" nnoremap gz :!zeal --query "<cword>"&<CR><CR>
let g:zv_disable_mapping = 1
nmap gz <Plug>Zeavim
vmap gz <Plug>ZVVisSelection
nmap gZ <Plug>ZVKeyDocset

" SimplyFold: Simple folding for Python {{{2

let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

" Syntastic: Syntax Checking {{{2

map <F9> :SyntasticToggleMode<CR>
let g:syntastic_tex_checkers = ['']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_flake8_post_args = '--ignore=E221,E251,E302,W293'
let g:syntastic_python_checkers = ['flake8']
" let g:syntastic_python_python_exec = ' /usr/bin/python3'

" EasyMotion: Vim Motions on Steroids: {{{2

map <space> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase = 1
let g:EasyMotion_use_smartsign_us = 1

" R: Vim R plug-in {{{2

let r_syntax_folding = 1
let vimrplugin_term = "konsole"
let g:vimrplugin_maxdeparse = 10000

" LaTeX: Custom LaTeX Options {{{2

nnoremap <leader>ok :LLPStartPreview<CR>
nnoremap <leader>lx :!xelatex -synctex=1 -shell-escape %<CR>
nnoremap <leader>lw :!pdflatex -synctex=1 "%"<CR>
nnoremap <leader>lb :!pdflatex -synctex=1 "%"<CR>:!bibtex %:r.aux<CR>:!pdflatex -synctex=1 "%"<CR>:!pdflatex -synctex=1 "%"<CR>
nnoremap <leader>lq :!xelatex -synctex=1 "%"<CR>:!bibtex %:r.aux<CR>:!xelatex -synctex=1 "%"<CR>:!xelatex -synctex=1 "%"<CR>

" latex-suite options
let g:Tex_Leader=','
let g:tex_flavor='latex'
let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf='pdflatex -shell-escape -synctex=1 "$*"'
let Tex_FoldedEnvironments=",frame,flashcard,tacomment,theorem,proof,definition"
let g:Tex_ViewRule_pdf='okular'

" Ignore warnings
" let g:Tex_IgnoreLevel = 10
" let g:Tex_IgnoredWarnings=
"             \'Underfull'."\n".
"             \'Overfull'."\n".
"             \'specifier changed to'."\n".
"             \'You have requested'."\n".
"             \'Missing number, treated as zero.'."\n".
"             \'There were undefined references'."\n".
"             \'Citation %.%# undefined'."\n".
"             \'LaTeX Font Warning'."\n".
"             \'Text page %.%# contains only floats.'

" Markdown: {{{2

let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

" Preview: Preview various file types in browser {{{2

let g:PreviewBrowsers = 'google-chrome-unstable,chromium-browser,firefox,opera,epiphany,safari'
nmap <Leader>pp  :Preview<CR>
nmap <Leader>pm :PreviewMarkdown<CR>
nmap <Leader>pt :PreviewTextile<CR>
nmap <Leader>pr :PreviewRdoc<CR>
nmap <Leader>ph :PreviewHtml<CR>

" FileType Options: Specific file-specific options {{{2

" Double-Check that we're in PEP8 format
au BufNewFile,BufRead *.py set
            \ tabstop=4
            \ softtabstop=4
            \ shiftwidth=4
            \ expandtab
            \ autoindent
            \ fileformat=unix

" au BufNewFile,BufRead *.js, *.html, *.css, *.tex set
"             \ tabstop=2
"             \ softtabstop=2
"             \ shiftwidth=2
"             \ expandtab

" Custom spacing, folding, settings
autocmd BufEnter * if &filetype == "" | setlocal ft=text | endif
autocmd FileType tex setlocal ts=2 et sw=2 sts=2
autocmd FileType tex setlocal nocursorline nocursorcolumn colorcolumn=
autocmd FileType tex 2match OverLength //
autocmd FileType markdown setlocal nocursorline nocursorcolumn colorcolumn=
autocmd FileType markdown 2match OverLength //
autocmd FileType stata 2match OverLength /\%91v.\+/
autocmd FileType stata setlocal comments=b:*,fb:-,s1:/*,mb:*,ex:*/,://,:*
autocmd FileType stata setlocal commentstring=*%s
autocmd FileType sas   setlocal comments=s0:/*,m0:*,ex0:*/
autocmd FileType text  2match OverLength //

" Python with virtualenv support
py << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__ = activate_this))
EOF

" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}
