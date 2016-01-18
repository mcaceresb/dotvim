" ----------------------------------------------------------------------------
" Program: tmp-stata.vim
" Author:  Mauricio Caceres <caceres@nber.org>
" Created: Sun Dec 20 22:29:03 EST 2015
" Updated: Sun Dec 20 22:29:03 EST 2015
" Purpose: Stata
" Note:    Stata

" Tmp: About to get cut or survive! {{{!
"
" Latex: Vim latex plug-in (also latex preview) {{{2
" Please note I currently used a mangled version of vim-latex, which
" I put in vim-latex-abridged, because a lot of its features are more
" annoying than useful. I complement it with LaTeX-Box and a lot of
" snippets (UltiSnips is my engine). Should I attempt to migrate away
" from vim-latex fully?

" Generic LaTeX compile rules
" nnoremap <leader>ok :LLPStartPreview<CR>
" nnoremap <leader>lx :!xelatex -synctex=1 -shell-escape %<CR>
" nnoremap <leader>lw :!pdflatex -synctex=1 "%"<CR>
" nnoremap <leader>lb :!pdflatex -synctex=1 "%"<CR>:!bibtex %:r.aux<CR>:!pdflatex -synctex=1 "%"<CR>:!pdflatex -synctex=1 "%"<CR>
" nnoremap <leader>lq :!xelatex -synctex=1 "%"<CR>:!bibtex %:r.aux<CR>:!xelatex -synctex=1 "%"<CR>:!xelatex -synctex=1 "%"<CR>

" latex-suite options
" let g:Tex_Leader=','
" let g:tex_flavor='latex'
" let g:Tex_DefaultTargetFormat='pdf'
" let g:Tex_CompileRule_pdf='pdflatex -shell-escape -synctex=1 "$*"'
" let Tex_FoldedEnvironments=",frame,flashcard,tacomment,theorem,proof,definition"
" let g:Tex_ViewRule_pdf='okular'

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

" R: Vim R plug-in {{{2
" let r_syntax_folding = 1
" let vimrplugin_term = "konsole"
" let g:vimrplugin_maxdeparse = 10000

" Sweave files (figure it out if you ever use Sweave again)
" au BufNewFile,BufRead *.Rnw set filetype=tex
" let g:SweaveTexReorder = "fnam=\"%:r.tex\";echo $\"`sed -n '1,2p' $fnam`\"$'\n'\"\usepackage{Sweave}\"" .
"             \ "$'\n'$\"`awk '/\\documentclass/{flag=1;next}/\\usepackage{Sweave}/{flag=0}flag' $fnam`\"" .
"             \ "$'\n'$\"`awk '/\\usepackage{Sweave}/{flag=1;next}/\\end{document}/{flag=0}flag' $fnam`\"" .
"             \ "$'\n'\"\end{document}\" > \"$fnam\"<CR>"
" nnoremap \sm :call StartR("R")<CR>:call RSweave()<CR>
"             \:call g:SendCmdToR(system(g:SweaveTexReorder))<CR>
"             \:call RMakePDF("nobib", 0)<CR>
" nnoremap \sr :!fnam="%:r.tex";
"             \ echo $"`sed -n '1,2p' $fnam`"$'\n'$"\usepackage{Sweave}"
"             \ $'\n'$"`awk '/\\documentclass/{flag=1;next}/\\usepackage{Sweave}/{flag=0}flag' $fnam`"
"             \ $'\n'$"`awk '/\\usepackage{Sweave}/{flag=1;next}/\\end{document}/{flag=0}flag' $fnam`"
"             \ $'\n'"\end{document}" > "$fnam"<CR>
"             \ :sleep 100m<CR>
"             \ :!pdflatex "%:r.tex"<CR>

" Julia: {{{2
" let g:latex_to_unicode_tab = 0

" Python Mode: Vim Python Mode {{{2
" let g:pymode_lint_ignore = "E221,E251,E261,E302,E501," . "W0401"
" let g:pymode_rope = 0
" let g:pymode_rope_completion = 0
" let g:pymode_rope_autoimport = 0
" let g:pymode_options_colorcolumn  = 0
" let g:pymode_rope_complete_on_dot = 0
" let g:pymode_rope_completion_bind = '<C-L>'
" nnoremap <leader><Leader>c :PymodeLintToggle<CR>

" NeoComplete: And other {{{2

" These are options I like
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#fallback_mappings = ["\<C-x>\<C-o>", "\<C-x>\<C-n>"]
" let g:neocomplete#sources#syntax#min_keyword_length = 2

" This is for proper <TAB> completion
" inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" inoremap <expr><S-TAB>  pumvisible() ? "\<C-P>" : "\<S-TAB>"

" Plugin key-mappings.
" inoremap <expr><C-g>     neocomplete#undo_completion()
" inoremap <expr><C-l>     neocomplete#complete_common_string()

" This is for keyword completion
" if !exists('g:neocomplete#keyword_patterns')
"     let g:neocomplete#keyword_patterns = {}
" endif
" let g:neocomplete#keyword_patterns._ = '^\\\?\h\w*$'
" let keyword_patterns = {}
" let keyword_patterns = {'tex' : '\h\w\{,2}:\%(\w*\|\w*_\w*\)\?'}
" let keyword_patterns = {'tex' : '\h\w*:\%(\w*_\w*\)\?'}
" let g:neocomplete#force_omni_input_patterns = {'tex' : '\v\\\a*(ref|cite)\a*\**([^]]*\])?\{(|[^}]*,)'}
" call neocomplete#custom#source('buffer', 'keyword_patterns', keyword_patterns)

" let g:neocomplete#sources#dictionary#dictionaries = {
"             \ 'default' : '',
"             \ 'tex' : '/home/mauricio/.vim/spell/en.utf-8.add,/home/mauricio/.vim/spell/random-spelling-help'
"             \ }

" " This may not be necessary
" if !exists('g:neocomplete#sources')
"     let g:neocomplete#sources = {}
" endif
" let g:neocomplete#sources.tex = ['buffer',
"             \ 'ultisnips',
"             \ 'dictionary',
"             \ 'file',
"             \ 'syntax',
"             \ 'include',
"             \ 'member',
"             \ 'omni',
"             \ 'tag',
"             \ 'file/include']

" EasyMotion: Easy motion to places {{{2
" nmap <Tab>s <Plug>(easymotion-s2)
" nmap <Tab> <Plug>(easymotion-prefix)
" nmap <Tab><Tab> <Plug>(easymotion-sn)

" Unite: Fuzzy file finder and aux plug-ins {{{2

" Unite: The plug-in itself {{{3
" let bundle = neobundle#get('unite')
" function! bundle.hooks.on_source(bundle)
"     call unite#filters#matcher_default#use(['matcher_fuzzy'])
"     call unite#filters#sorter_default#use(['sorter_rank'])
"     call unite#custom#profile('default', 'context', {
"                 \ 'start_insert': 1
"                 \ })
" endfunction

" " let g:unite_data_directory=s:get_cache_dir('unite')
" let g:unite_data_directory='~/.cache/unite/'
" let g:unite_source_history_yank_enable=1
" let g:unite_source_rec_max_cache_files=5000

" if executable('ag')
"     let g:unite_source_grep_command='ag'
"     let agargs='--nocolor --line-numbers --nogroup -S -B2 -A3'
"     let g:unite_source_grep_default_opts=agargs
"     let g:unite_source_grep_recursive_opt=''
" elseif executable('ack')
"     let g:unite_source_grep_command='ack'
"     let ackargs='--no-heading --no-color -B2 -A3'
"     let g:unite_source_grep_default_opts=ackargs
"     let g:unite_source_grep_recursive_opt=''
" endif

" function! s:unite_settings()
"     nmap <buffer> <ESC> <plug>(unite_exit)
"     imap <buffer> <ESC> <plug>(unite_exit)
"     nmap <buffer> <A-q> <plug>(unite_exit)
"     imap <buffer> <A-q> <plug>(unite_exit)
"     imap <buffer> <C-j> <plug>(unite_select_next_line)
"     imap <buffer> <C-k> <plug>(unite_select_previous_line)
" endfunction
" autocmd FileType unite call s:unite_settings()

" nmap <space> [unite]
" nnoremap [unite] <nop>
" nnoremap <silent> [unite]<space> :<C-u>Unite -auto-resize -auto-preview -buffer-name=mixed -toggle file_rec/async:! buffer file_mru bookmark<cr><c-u>
" nnoremap <silent> [unite]p :<C-u>Unite -auto-resize -auto-preview -buffer-name=files -toggle file_rec/async:!<cr><c-u>
" nnoremap <silent> [unite]e :<C-u>Unite -auto-resize -auto-preview -buffer-name=recent file_mru<cr>
" nnoremap <silent> [unite]b :<C-u>Unite -auto-resize -auto-preview -buffer-name=buffers buffer file_mru<cr>
" nnoremap <silent> [unite]y :<C-u>Unite -auto-resize -buffer-name=yanks history/yank<cr>
" nnoremap <silent> [unite]l :<C-u>Unite -auto-resize -buffer-name=line line<cr>
" nnoremap <silent> [unite]m :<C-u>Unite -auto-resize -buffer-name=mappings mapping<cr>
" nnoremap <silent> [unite]/ :<C-u>Unite -no-quit -buffer-name=search grep:.<cr>
" nnoremap <silent> [unite]s :<C-u>Unite -quick-match buffer<cr>

" " Neomru: unite-airline_themes search {{{3
"
" " Unite Airline: unite-airline_themes search {{{3
" nnoremap <silent> [unite]a :<C-u>Unite -winheight=10 -auto-preview -buffer-name=airline_themes airline_themes<cr>
"
" " Unite Color Scheme: unite-colorscheme search {{{3
" nnoremap <silent> [unite]c :<C-u>Unite -auto-resize -auto-preview -buffer-name=colorschemes colorscheme<cr>
"
" " Unite Tag: unite-tag search {{{3
" nnoremap <silent> [unite]t :<C-u>Unite -auto-resize -buffer-name=tag tag tag/file<cr>
"
" " Unite Outline: unite-outline search {{{3
" nnoremap <silent> [unite]o :<C-u>Unite -auto-resize -buffer-name=outline outline<cr>
"
" " Unite Help: unite-help search  {{{3
" nnoremap <silent> [unite]h :<C-u>Unite -auto-resize -buffer-name=help help<cr>
"
" " Junkfile: Junk files {{{3
" " let g:junkfile#directory=s:get_cache_dir('junk')
" let g:junkfile#directory='~/.cache/junk/'
" nnoremap <silent> [unite]j :<C-u>Unite -auto-resize -buffer-name=junk junkfile junkfile/new<cr>

" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}
