"-----------------------------------------------------------------------------
" Project: dotvim
" Program: functions.vim
" Purpose: Mappings to functions or longer snippets
" Updated: Wed 03 Jun 2015 02:07:41 AM EDT
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>

" Function Mappings: {{{1
"------------------------------------------------

" Toggle J -> 6j and just J
let jumpinglevel=0
nnoremap <F2> <ESC>:call JumpingEfficienciesToggle()<CR>

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()

" Show syntax highlighting groups for word under cursor
nmap <C-A-P> :call <SID>SynStack()<CR>

" Custom highlighting of code chunks
nnoremap <leader><F12> :call TextEnableCodeSnip('r', '\\begin{Scode}', '\\end{Scode}', 'SpecialComment')<CR>
nnoremap <leader><F11> :call TextEnableCodeSnip('r', '>>=', '@', 'SpecialComment')<CR>

" Highlight word under cursor
set updatetime=500
nnoremap z. :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

" Toggle conceal color bc IndentLines uses conceal
nnoremap <Leader>g :call ToggleIndentLines()<CR>

" Toggle git gutter highlights
nnoremap <F3> :call ToggleAllGitGutter()<CR>

" WordNet word lookup
command! -nargs=+ Wn call WordNetOverviews("<args>")
command! -nargs=+ Wordnet call WordNetOverviews("<args>")

noremap <Leader>we "wyiw:call WordNetOverviews(@w,"-synsn")<CR>
noremap <Leader>wd "wyiw:call WordNetBrowse(@w,"-over")<CR>
noremap <C-A-w> "wyiw:call WordNetOverviews(@w,"-over")<CR>
noremap <C-A-q> "wyiw:call WordNetBrowse(@w,"-synsn")<CR>

" Plugin Functions: {{{1
"------------------------------------------------

" ToggleIndentLines: Toggle conceal color bc IndentLines uses conceal {{{2
function! ConcealBackgroundCheck()
    if &background=='light'
        " hi Conceal gui=none guifg=#000000
        hi Conceal gui=none guifg=#7F00FF
    else
        " hi Conceal guifg=#fffffa
        hi Conceal guifg=#e3d796
    endif
endfunction

call ConcealBackgroundCheck()
function! ToggleIndentLines()
    if g:indentLine_myToggle == 0
        silent exec "IndentLinesToggle"
        echo "Showing tab markers"
        let g:indentLine_myToggle = 1
        highlight Conceal gui=none guifg=gray42
    else
        silen exec "IndentLinesToggle"
        echo "Hiding tab markers"
        let g:indentLine_myToggle = 0
        call ConcealBackgroundCheck()
    endif
endfunction

" Multiple Cursors Fix: Neocomplete and multiple-cursors compatibility fix {{{2

" From https://github.com/terryma/vim-multiple-cursors#interactions-with-other-plugins
" function! Multiple_cursors_before()
"     exe 'NeoCompleteLock'
"     echo 'Disabled autocomplete'
" endfunction

" function! Multiple_cursors_after()
"     exe 'NeoCompleteUnlock'
"     echo 'Enabled autocomplete'
" endfunction

" ToggleAllGitGutter: Toggle git gutter's highlighting with console msg {{{2
function! ToggleAllGitGutter()
    silent exec "GitGutterToggle"
    silent exec "GitGutterSignsToggle"
    silent exec "GitGutterLineHighlightsToggle"
    if g:gitgutter_highlight_lines == 1
        echo "Showing git differences"
    else
        echo "Hiding git differences"
    endif
endfunction

" General Functions: {{{1
"------------------------------------------------

" JumpingEfficienciesToggle: Toggle J -> 6j and just J {{{2
function! JumpingEfficienciesToggle()
    if g:jumpinglevel == 0
        nnoremap J 6j
        nnoremap K 6k
        let g:jumpinglevel=1
        echo "Jumping a bunch with J/K now"
    else
        nnoremap J J
        nnoremap K f i<CR><ESC>
        let g:jumpinglevel=0
        echo "Joining and splitting lines with J/K now"
    endif
endfunction

" SynStack: Show syntax highlighting groups for word under cursor {{{2
" From http://vimcasts.org/episodes/creating-colorschemes-for-vim/
function! <SID>SynStack()
    if !exists("*synstack")
        return
    endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

" TextEnableCodeSnip: Custom region highlighting {{{2
" From http://vim.wikia.com/wiki/Different_syntax_highlighting_within_regions_of_a_file
function! TextEnableCodeSnip(filetype,start,end,textSnipHl) abort
    let ft=toupper(a:filetype)
    let group='textGroup'.ft
    if exists('b:current_syntax')
        let s:current_syntax=b:current_syntax
        " Remove current syntax definition, as some syntax files (e.g. cpp.vim)
        " do nothing if b:current_syntax is defined.
        unlet b:current_syntax
    endif
    execute 'syntax include @'.group.' syntax/'.a:filetype.'.vim'
    try
        execute 'syntax include @'.group.' after/syntax/'.a:filetype.'.vim'
    catch
    endtry
    if exists('s:current_syntax')
        let b:current_syntax=s:current_syntax
    else
        unlet b:current_syntax
    endif
    execute 'syntax region textSnip'.ft.'
                \matchgroup='.a:textSnipHl.'
                \start="'.a:start.'" end="'.a:end.'"
                \contains=@'.group
endfunction
hi link Snip SpecialComment

" AutoHighlightToggle: Highlight word under cursor. n, N work as with * {{{2
" From http://vim.wikia.com/wiki/Auto_highlight_current_word_when_idle
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=500
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=150
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction

" Stab: Set tabstop, softtabstop and shiftwidth to the same value {{{2
" From http://vimcasts.org/episodes/tabs-and-spaces/
function! Stab()
    let l:tabstop = 1 * input('set tabstop = softtabstop = shiftwidth = ')
    if l:tabstop > 0
        let &l:sts = l:tabstop
        let &l:ts = l:tabstop
        let &l:sw = l:tabstop
    endif
    call SummarizeTabs()
endfunction

function! SummarizeTabs()
    try
        echohl ModeMsg
        echon 'tabstop='.&l:ts
        echon ' shiftwidth='.&l:sw
        echon ' softtabstop='.&l:sts
        if &l:et
            echon ' expandtab'
        else
            echon ' noexpandtab'
        endif
    finally
        echohl None
    endtry
endfunction

" WordNet: Look up word in word net {{{2
" Based on https://github.com/timcharper/wordnet.vim/blob/master/plugin/wordnet.vim
function! WordNetBrowse (word,args)
    let getsynsn =  ' | xargs -d= | grep -i \>'
    let allsynsn = system('wordnet ' . a:word . ' ' .a:args . getsynsn)
    let allsynsn = substitute(allsynsn, '\n', ',', 'g')
    let allsynsn = substitute(allsynsn, '\s', '', 'g')
    let allsynsn = substitute(allsynsn, '>', '', 'g')
    let allsynsn = substitute(allsynsn, 'INSTANCEOF', '', 'g')

    if allsynsn == ""
        let allsynsn = "Cannot find word: " . a:word
    endif
    echo allsynsn
endfunction

function! WordNetOverviews (word,args)
    let definition = system("wordnet " . a:word . " " . a:args)
    if definition == ""
        echo "Cannot find word: " . a:word
    else
        call s:WordNetOpenWindow(definition)
    endif
endfunction

if !exists('g:loaded_wordnet')
    function! s:WordNetOpenWindow (text)
        " If the buffer is visible
        if bufwinnr("__WordNet__") > -1
            " switch to it
            exec bufwinnr("__WordNet__") . "wincmd w"
            hide
        endif

        if bufnr("__WordNet__") > -1
            exec bufnr("__WordNet__") . "bdelete!"
        endif

        exec 'silent! keepalt botright 10split'
        exec ":e __WordNet__"
        let s:wordnet_buffer_id = bufnr('%')

        call append("^", split(a:text, "\n"))
        exec 0
        " Mark the buffer as scratch
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
        setlocal nonumber
        setlocal nobuflisted
        setlocal readonly
        setlocal nomodifiable

        mapclear <buffer>
        syn match overviewHeader      /^Overview of .\+/
        syn match definitionEntry  /\v^[0-9]+\. .+$/ contains=numberedList,word
        syn match numberedList  /\v^[0-9]+\. / contained
        syn match word  /\v([0-9]+\.[0-9\(\) ]*)@<=[^-]+/ contained
        hi link overviewHeader Title
        hi link numberedList Operator
        hi def word term=bold cterm=bold gui=bold
        nnoremap <silent> <buffer> <ESC> :q<CR>
    endfunction
    let g:loaded_wordnet = 1
endif

" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}

