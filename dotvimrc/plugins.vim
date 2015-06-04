"-----------------------------------------------------------------------------
" Project: dotvim
" Program: plugins.vim
" Purpose: Various plugin options and customizations
" Updated: Wed 03 Jun 2015 02:18:47 AM EDT
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>

" Plug-ins and file-specific {{{1
"------------------------------------------------

" Vimproc: vimproc plugin {{{2
NeoBundle 'Shougo/vimproc.vim', {
            \ 'build' : {
            \     'windows' : 'tools\\update-dll-mingw',
            \     'cygwin' : 'make -f make_cygwin.mak',
            \     'mac' : 'make -f make_mac.mak',
            \     'linux' : 'make',
            \     'unix' : 'gmake',
            \    },
            \ }

" Airline: Awesome status indicator {{{2
NeoBundle 'bling/vim-airline', {'name' : 'airline'}
    let g:airline_theme='sol'
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

" Color Schemes: Various color schemes {{{2
" Please note I modify textmate from Drew Neil and twilight
NeoBundle 'flazz/vim-colorschemes', {'name' : 'colorschemes'}

" Colorizer: Hex color visualizer {{{2
NeoBundle 'lilydjwg/colorizer', {'name' : 'colorizer'}
" NeoBundle 'chrisbra/colorizer', {'name' : 'colorizer'}

" Commentary: Easy commenting {{{2
NeoBundle 'tpope/vim-commentary', {'name' : 'commentary'}

" CtrlP: Fast file navitation {{{2
NeoBundle 'kien/ctrlp.vim', {'name' : 'ctrlp'}
    let g:ctrlp_follow_symlinks = 1
    nnoremap <C-g> :CtrlPBuffer<CR>

" CSApprox: Approximate colors in terminal vim {{{2
NeoBundle 'godlygeek/csapprox', {'name' : 'csapprox'}

" Delimate: Auto-completion of delimiters {{{2
NeoBundle 'Raimondi/delimitMate', {'name' : 'delimate'}

" EasyMotion: Easy motion to places {{{2
NeoBundle 'Lokaltog/vim-easymotion', {'name' : 'easymotion'}
    nmap s <Plug>(easymotion-s2)
    nmap <Tab> <Plug>(easymotion-prefix)
    nmap <Tab><Tab> <Plug>(easymotion-sn)

" Exchange: Exchange vim objects {{{2
NeoBundle 'tommcdo/vim-exchange', {'name' : 'exchange'}

" Expand: Expand visual selection {{{2
NeoBundle 'terryma/vim-expand-region', {'name' : 'expand-region'}
NeoBundle 'kana/vim-textobj-line', {'name' : 'textobj-line'}
call expand_region#custom_text_objects('tex', {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'i]'  :1,
      \ 'ib'  :1,
      \ 'iB'  :1,
      \ 'is'  :0,
      \ 'il'  :0,
      \ 'ip'  :0,
      \ 'ie'  :0,
      \ })

" Fugitive: Git integration {{{2
NeoBundle 'tpope/vim-fugitive', {'name' : 'fugitive'}

NeoBundle 'sjl/gundo.vim', {'name' : 'gundo'}
" Gundo: Visualize undo history {{{2
    nnoremap <F11> :GundoToggle<CR>

" NERDTree: Nice file explorer for Vim {{{2
NeoBundle 'scrooloose/nerdtree', {'name' : 'nerdtree'}
" NeoBundle 'Shougo/vimfiler.vim', {'name' : 'vimfiler'}
    nnoremap <F10> :NERDTreeToggle<CR>

" Gitv: Git tree visualization {{{2
NeoBundle 'gregsexton/gitv', {'name' : 'gitv'}

" Gigutter: Git file changes visualization {{{2
NeoBundle 'airblade/vim-gitgutter', {'name' : 'gitgutter'}
    let g:gitgutter_highlight_lines = 1
    " nnoremap <F3> :GitGutterToggle<CR>:GitGutterSignsToggle<CR>:GitGutterLineHighlightsToggle<CR>

" IndentLines: Indentation Markers {{{2
NeoBundle 'Yggdroot/indentLine', {'name' : 'indentline'}
    let g:indentLine_char = "│"
    " let g:indentLine_color_gui = '#C0C0C0'
    let g:indentLine_color_gui = '#696969'
    let g:indentLine_enabled = 0
    let g:indentLine_myToggle = 0

" IPython: IPython integration {{{2
" NeoBundle 'ivanov/vim-ipython', {'name' : 'ipython'}
    let g:ipy_completefunc = ''
    let g:ipy_perform_mappings = 0
    nmap <Leader>- <ESC>:on<CR>
    nmap  <buffer> <silent> <C-F9> <Plug>(IPython-RunFile)
    nmap  <buffer> <silent> <Leader><Space>   <Plug>(IPython-RunLine)
    vmap  <buffer> <silent> <Leader><Space>   <Plug>(IPython-RunLines)

" Instant Markdown: Instant markdown preview {{{2
NeoBundle 'suan/vim-instant-markdown', {'name' : 'instant-markdown'}
    " let g:instant_markdown_autostart = 0
    " let g:instant_markdown_slow = 1
    " nnoremap <leader>p :InstantMarkdownPreview<CR>

" NeoComplete: And other {{{2
NeoBundle 'Shougo/neocomplete.vim', {'name' : 'neocomplete'}

    " These are options I like
    let g:neocomplete#enable_at_startup = 1
    let g:neocomplete#enable_smart_case = 1
    let g:neocomplete#sources#syntax#min_keyword_length = 2
    let g:neocomplete#sources#dictionary#dictionaries = {
                \ 'default' : '/home/mauricio/.vim/spell/en.utf-8.add,/home/mauricio/.vim/spell/random-spelling-help',
                \ 'tex' : '/home/mauricio/.vim/spell/en.utf-8.add,/home/mauricio/.vim/spell/random-spelling-help'
                \ }

    " This is for proper <TAB> completion
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    inoremap <expr><S-TAB>  pumvisible() ? "\<C-P>" : "\<S-TAB>"

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplete#undo_completion()
    inoremap <expr><C-l>     neocomplete#complete_common_string()

    " This may not be necessary
    if !exists('g:neocomplete#sources')
        let g:neocomplete#sources = {}
    endif
    let g:neocomplete#sources.tex = ['buffer',
                \ 'ultisnips',
                \ 'dictionary',
                \ 'file',
                \ 'syntax',
                \ 'include',
                \ 'member',
                \ 'omni',
                \ 'tag',
                \ 'file/include']

    " This is for keyword completion
    if !exists('g:neocomplete#keyword_patterns')
        let g:neocomplete#keyword_patterns = {}
    endif
    let g:neocomplete#keyword_patterns._ = '^\\\?\h\w*$'
    let keyword_patterns = {}
    " let keyword_patterns = {'tex' : '\h\w*:\%(\w*_\w*\)\?'}
    let keyword_patterns = {'tex' : '\h\w\{,2}:\%(\w*\|\w*_\w*\)\?'}
    call neocomplete#custom#source('buffer', 'keyword_patterns', keyword_patterns)

    " This is for reference completion (should have LaTeX-Box)
    let g:neocomplete#force_omni_input_patterns = {'tex' : '\v\\\a*(ref|cite)\a*([^]]*\])?\{(|[^}]*,)'}

" R: Vim R plug-in {{{2
NeoBundle 'jcfaria/Vim-R-plugin', {'name' : 'rplugin'}
    let r_syntax_folding = 1
    let vimrplugin_term  = "konsole"
    let g:vimrplugin_maxdeparse = 10000
    " let vimrplugin_term_cmd="konsole --profile white"
    " vnoremap <Space> <Plug>RDSendSelection
    " nnoremap <Space> <Plug>RDSendLine

    " Sweave files
    au BufNewFile,BufRead *.Rnw set filetype=tex

" Repeat: Improved dot command {{{2
NeoBundle 'tpope/vim-repeat', {'name' : 'repeat'}


" Snippets: Various snippets {{{2
" Please note that I modify all.snippets and tex*.snippets heavily
NeoBundle 'honza/vim-snippets', {'name' : 'snippets'}

" Stata: Basic stata {{{2
NeoBundle 'jpitblado/vim-stata', {'name' : 'stata'}

" Startify: Nice start screen {{{2
NeoBundle 'mhinz/vim-startify', {'name' : 'startify'}
    let g:startify_session_dir = '~/.vim/session'
    let g:startify_list_order  = [
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

" Surround: Improved surround {{{2
NeoBundle 'tpope/vim-surround', {'name' : 'surround'}

" Transpose: Transpose text {{{2
NeoBundle 'salsifis/vim-transpose', {'name' : 'transpose'}

" Tabular: Nice alignment features {{{2
NeoBundle 'godlygeek/tabular', {'name' : 'tabular'}
    vmap <leader><leader>t :Tabularize /&<CR>
    nmap <leader><leader>t :Tabularize /&<CR>

    vmap <leader><leader># :Tabularize /#<CR>
    vmap <leader><leader>% :Tabularize /%<CR>
    vmap <leader><leader>& :Tabularize /&<CR>
    vmap <leader><leader>* :Tabularize /*<CR>
    vmap <leader><leader>= :Tabularize /=<CR>
    vmap <leader><leader>, :Tabularize /,<CR>
    vmap <leader><leader>" :Tabularize /"<CR>
    vmap <leader><leader>: :Tabularize /:<CR>
    " vmap <leader><leader>\| :Tabularize /|<CR>
    vmap <leader><leader>$ :Tabularize /$<CR>

    " vmap <leader><leader>## :Tabularize /#\zs<CR>
    " vmap <leader><leader>%% :Tabularize /%\zs<CR>
    " vmap <leader><leader>&& :Tabularize /&\zs<CR>
    " vmap <leader><leader>** :Tabularize /*\zs<CR>
    " vmap <leader><leader>"" :Tabularize /"\zs<CR>
    " vmap <leader><leader>,, :Tabularize /,\zs<CR>
    " vmap <leader><leader>== :Tabularize /=\zs<CR>
    " vmap <leader><leader>:: :Tabularize /:\zs<CR>
    " " vmap <leader><leader>\|\| :Tabularize /|\zs<CR>
    " vmap <leader><leader>$$ :Tabularize /$\zs<CR>

    nmap <leader><leader># :Tabularize /#<CR>
    nmap <leader><leader>% :Tabularize /%<CR>
    nmap <leader><leader>& :Tabularize /&<CR>
    nmap <leader><leader>* :Tabularize /*<CR>
    nmap <leader><leader>= :Tabularize /=<CR>
    nmap <leader><leader>, :Tabularize /,<CR>
    nmap <leader><leader>" :Tabularize /"<CR>
    nmap <leader><leader>: :Tabularize /:<CR>
    " nmap <leader><leader>\| :Tabularize /|<CR>
    nmap <leader><leader>$ :Tabularize /$<CR>

    " nmap <leader><leader>## :Tabularize /#\zs<CR>
    " nmap <leader><leader>%% :Tabularize /%\zs<CR>
    " nmap <leader><leader>&& :Tabularize /&\zs<CR>
    " nmap <leader><leader>** :Tabularize /*\zs<CR>
    " nmap <leader><leader>"" :Tabularize /"\zs<CR>
    " nmap <leader><leader>,, :Tabularize /,\zs<CR>
    " nmap <leader><leader>== :Tabularize /=\zs<CR>
    " nmap <leader><leader>:: :Tabularize /:\zs<CR>
    " " nmap <leader><leader>\|\| :Tabularize /|\zs<CR>
    " nmap <leader><leader>$$ :Tabularize /$\zs<CR>

" UltiSnips: Fairly cool snippet plugin {{{2
NeoBundle 'SirVer/ultisnips', {'name' : 'ultisnips'}
    let g:UltiSnipsUsePythonVersion = 2
    let g:UltiSnipsExpandTrigger = "<s-space>"
    let g:ultisnips_python_style = "google"
    let g:UltiSnipsSnippetsDir = "~/.vim/bundle/snippets/UltiSnips"

" Unimpaired: Various [] mappings {{{2
NeoBundle 'tpope/vim-unimpaired', {'name' : 'unimpaired'}

" Unite: Fuzzy file finder and aux plug-ins {{{2

" Unite: The plug-in itself {{{3
NeoBundle 'Shougo/unite.vim', {'name' : 'unite'}
    let bundle = neobundle#get('unite')
    function! bundle.hooks.on_source(bundle)
        call unite#filters#matcher_default#use(['matcher_fuzzy'])
        call unite#filters#sorter_default#use(['sorter_rank'])
        call unite#custom#profile('default', 'context', {
                    \ 'start_insert': 1
                    \ })
    endfunction

    " let g:unite_data_directory=s:get_cache_dir('unite')
    let g:unite_data_directory='~/.cache/unite/'
    let g:unite_source_history_yank_enable=1
    let g:unite_source_rec_max_cache_files=5000

    if executable('ag')
        let g:unite_source_grep_command='ag'
        let agargs='--nocolor --line-numbers --nogroup -S -B2 -A3'
        let g:unite_source_grep_default_opts=agargs
        let g:unite_source_grep_recursive_opt=''
    elseif executable('ack')
        let g:unite_source_grep_command='ack'
        let ackargs='--no-heading --no-color -B2 -A3'
        let g:unite_source_grep_default_opts=ackargs
        let g:unite_source_grep_recursive_opt=''
    endif

    function! s:unite_settings()
        nmap <buffer> <ESC> <plug>(unite_exit)
        imap <buffer> <ESC> <plug>(unite_exit)
        nmap <buffer> <A-q> <plug>(unite_exit)
        imap <buffer> <A-q> <plug>(unite_exit)
        imap <buffer> <C-j> <plug>(unite_select_next_line)
        imap <buffer> <C-k> <plug>(unite_select_previous_line)
    endfunction
    autocmd FileType unite call s:unite_settings()

    nmap <space> [unite]
    nnoremap [unite] <nop>
    nnoremap <silent> [unite]<space> :<C-u>Unite -auto-resize -auto-preview -buffer-name=mixed -toggle file_rec/async:! buffer file_mru bookmark<cr><c-u>
    nnoremap <silent> [unite]p :<C-u>Unite -auto-resize -auto-preview -buffer-name=files -toggle file_rec/async:!<cr><c-u>
    nnoremap <silent> [unite]e :<C-u>Unite -auto-resize -auto-preview -buffer-name=recent file_mru<cr>
    nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -auto-preview -buffer-name=buffers buffer file_mru<cr>
    nnoremap <silent> [unite]y :<C-u>Unite -auto-resize -buffer-name=yanks history/yank<cr>
    nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
    nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
    nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
    nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>

" Neomru: unite-airline_themes search {{{3
NeoBundleLazy 'Shougo/neomru.vim',
            \ {'autoload' : {'unite_sources' : 'file_mru'}}

" Unite Airline: unite-airline_themes search {{{3
NeoBundleLazy 'osyo-manga/unite-airline_themes',
            \ {'autoload' :  {'unite_sources' : 'airline_themes'}}
    nnoremap <silent> [unite]a :<C-u>Unite -winheight=10 -auto-preview -buffer-name=airline_themes airline_themes<cr>

" Unite Color Scheme: unite-colorscheme search {{{3
NeoBundleLazy 'ujihisa/unite-colorscheme',
            \ {'autoload' :  {'unite_sources' : 'colorscheme'}}
    nnoremap <silent> [unite]c :<C-u>Unite -auto-resize -auto-preview -buffer-name=colorschemes colorscheme<cr>

" Unite Tag: unite-tag search {{{3
NeoBundleLazy 'tsukkee/unite-tag',
            \ {'autoload' : {'unite_sources' : ['tag', 'tag/file']}}
    nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tag tag tag/file<cr>

" Unite Outline: unite-outline search {{{3
NeoBundleLazy 'Shougo/unite-outline',
            \ {'autoload' : {'unite_sources' : 'outline'}}
    nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>

" Unite Help: unite-help search  {{{3
NeoBundleLazy 'Shougo/unite-help',
            \ {'autoload' : {'unite_sources' : 'help'}}
    nnoremap <silent> [unite]h :<C-u>Unite -auto-resize -buffer-name=help help<cr>

" Junkfile: Junk files {{{3
NeoBundleLazy 'Shougo/junkfile.vim',
            \ {'autoload' : {'commands' : 'JunkfileOpen', 'unite_sources' : ['junkfile', 'junkfile/new']}}
    " let g:junkfile#directory=s:get_cache_dir('junk')
    let g:junkfile#directory='~/.cache/junk/'
    nnoremap <silent> [unite]j :<C-u>Unite -auto-resize -buffer-name=junk junkfile junkfile/new<cr>


" Latex: Vim latex plug-in (also latex preview) {{{2
" Please note I currently used a mangled version of vim-latex, which
" I put in vim-latex-abridged, because a lot of its features are more
" annoying than useful. I complement it with LaTeX-Box and a lot of
" snippets (UltiSnips is my engine). Should I attempt to migrate away
" from vim-latex fully?
NeoBundle 'xuhdev/vim-latex-live-preview', {'name' : 'latex-live-preview'}
NeoBundle 'LaTeX-Box-Team/LaTeX-Box', {'name' : 'latex-box'}

    " Generic LaTeX compile rules
    nnoremap <leader>ok :LLPStartPreview<CR>
    nnoremap <leader>lx :!xelatex %<CR>
    nnoremap <leader>lw :!pdflatex -synctex=1 "%"<CR>
    nnoremap <leader>lb :!pdflatex -synctex=1 "%"<CR>:!bibtex %:r.aux<CR>:!pdflatex -synctex=1 "%"<CR>:!pdflatex -synctex=1 "%"<CR>

    " latex-suite options
    let g:Tex_Leader=','
    let g:tex_flavor='latex'
    let g:Tex_DefaultTargetFormat='pdf'
    let g:Tex_CompileRule_pdf='pdflatex -shell-escape -synctex=1 "$*"'
    let Tex_FoldedEnvironments=",frame,flashcard,tacomment,theorem,proof,definition"
    let g:Tex_ViewRule_pdf='okular'

    " Ignore warnings
    let g:Tex_IgnoreLevel = 8
    let g:Tex_IgnoredWarnings=
                \'Underfull'."\n".
                \'Overfull'."\n".
                \'specifier changed to'."\n".
                \'You have requested'."\n".
                \'Missing number, treated as zero.'."\n".
                \'There were undefined references'."\n".
                \'Citation %.%# undefined'."\n".
                \'LaTeX Font Warning'
    " Live preview options
    let g:livepreview_previewer = 'okular'

" FileType Options: Specific file-specific options {{{2
    " Custom spacing, folding, settings
    autocmd FileType python setlocal fdm=marker
    autocmd FileType tex set makeprg=pdflatex\ -synctex=1\ "%"
    autocmd FileType tex setlocal ts=2 et sw=2 sts=2
    autocmd FileType tex setlocal nocursorline

    " Omnifunc
    " autocmd FileType tex set omnifunc=LatexBox_Complete
    " autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

"------------------------------------------------
" Unused: Plug-ins I do not currently use (but did once) {{{1

" Ack: Fast search in files {{{2

" Arpeggio: Chord-like mapping awesomeness {{{2
    " execute arpeggio#load()
    " Arpeggio inoremap jk <ESC>
    " Arpeggio imap jp <ESC>ma<C-Space><ESC>`aa
    " Arpeggio imap ji <S-space>
    " Arpeggio nnoremap jk :w<CR>


" EasyMotion: Use leader {{{2
    " let g:EasyMotion_leader_key = '<Leader>'

" Jedi: Jedi plugin and general python settings {{{2
    " au FileType python set makeprg=python\ %
    " let g:jedi#completions_command = "<C-N>"
    " let g:jedi#auto_initialization = 1
    " inoremap <silent> <buffer> <C-N> <c-x><c-o>

    " let g:jedi#popup_on_dot = 0
    " let g:jedi#auto_vim_configuration = 0
    " let g:jedi#popup_select_first = 0
    " let g:jedi#completions_enabled = 0

" MultipleCursors: Very cool but way slow {{{2

" Syntastic: Automatic Syntax Checker {{{2

    " Easy toggle bc LaTeX checker sucks
    " nnoremap <leader>q :SyntasticCheck<CR> :SyntasticToggleMode<CR>
    " let g:syntastic_python_checkers = ['python']

" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}

