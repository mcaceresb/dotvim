"-----------------------------------------------------------------------------
" Project: dotvim
" Program: functions.vim
" Purpose: Mappings to functions or longer snippets
" Updated: Wed 03 Jun 2015 02:07:41 AM EDT
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>

" Function Mappings: {{{1
"------------------------------------------------
"
" Precision rounding
" nnoremap <leader>ro :%s/\d*\.\d\+/\=printf('%.2f',str2float(submatch(0)))/g
" vnoremap <leader>ro :s/\d*\.\d\+/\=printf('%.2f',str2float(submatch(0)))/g
nnoremap <leader>ro :call Rounding("%")<CR>
vnoremap <leader>ro :call Rounding("")<CR>
nnoremap <leader>rc :%s/\v(\d)((\d\d\d)+\d@!)@=/\1,/g<CR>
vnoremap <leader>rc :s/\v(\d)((\d\d\d)+\d@!)@=/\1,/g<CR>

" Preserve mappings (run a command and preserve history/cursor)
" nmap <Leader>rs mm:%s/\s*$//g<CR>`m<ESC>cxc:noh<CR>
nmap <silent> <Leader>rs :call Preserve("%s/\\s\\+$//e")<CR>
nmap <silent> <Leader>r= :call Preserve("normal gg=G")<CR>
" autocmd BufWritePre *.py,*.js :call Preserve("%s/\\s\\+$//e")

" Toggle OverLength match
nnoremap <leader><leader><CR> :call OverLengthToggle()<CR>

" Toggle conceal level
nnoremap <Leader>h :call ConcealLevelToggle()<CR>

" Toggle git gutter highlights
nnoremap <F3> :call ToggleAllGitGutter()<CR>

" Highlight word under cursor
set updatetime=500
nnoremap z. :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>

" Set tabstop, softtabstop and shiftwidth to the same value
command! -nargs=* Stab call Stab()

" Show syntax highlighting groups for word under cursor
nmap <C-A-p> :call <SID>SynStack()<CR>

" Custom highlighting of code chunks
nnoremap <leader><F12> :call TextEnableCodeSnip('r', '\\begin{Scode}', '\\end{Scode}', 'SpecialComment')<CR>
nnoremap <leader><F11> :call TextEnableCodeSnip('r', '>>=', '@', 'SpecialComment')<CR>

" Toggle conceal color bc IndentLines uses conceal
nnoremap <Leader><Leader>g :call ToggleIndentLines()<CR>

" WordNet word lookup
command! -nargs=+ Wn call WordNetOverviews("<args>")
command! -nargs=+ Wordnet call WordNetOverviews("<args>")

noremap <Leader>we "wyiw:call WordNetOverviews(@w,"-synsn")<CR>
noremap <Leader>wd "wyiw:call WordNetBrowse(@w,"-over")<CR>
noremap <Leader>ww "wyiw:call WordNetOverviews(@w,"-over")<CR>
noremap <Leader>wq "wyiw:call WordNetBrowse(@w,"-synsn")<CR>

" Plugin Functions: {{{1
"------------------------------------------------

" ToggleIndentLines: Toggle conceal color bc IndentLines uses conceal {{{2
function! ConcealBackgroundCheck()
    if &background=='light'
    else
    endif
endfunction

call ConcealBackgroundCheck()
function! ToggleIndentLines()
    if g:indentLine_myToggle == 0
        silent exec "IndentLinesToggle"
        echo "Showing tab markers"
        let g:indentLine_myToggle = 1
    else
        silen exec "IndentLinesToggle"
        echo "Hiding tab markers"
        let g:indentLine_myToggle = 0
        call ConcealBackgroundCheck()
    endif
endfunction

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

" Make Short Log: Make short log from long log {{{2
command! MakeShortLog call MakeShortLog()
function! MakeShortLog() range
    let _s=@/
    let l = line(".")
    let c = col(".")

    execute 'normal! /History (Short)'
    execute 'normal! }jV}kc``````qaqmm'
    execute 'g/Event:.*\_.Date:.*$/normal! v/^Date$"Ay'
    execute 'normal! `m0"aPV}k'
    execute 'normal! :s/Date://ggv'
    execute 'normal! :g/^ /AdjustDategv'
    execute 'normal! :g/Event: /move+1gv'
    execute 'normal! :s/\vEvent: //ggvok'
    execute 'normal! :g/^\[/joingv'
    execute 'normal! :s/\] \*\*/] /ggv'
    execute 'normal! :s/\*\*\s*$//g'

    let @/=_s
    call cursor(l, c)
endfunction

command! AdjustDate call AdjustDate()
function! AdjustDate()
let g:mline = split(getline('.'))
python << EOF
from dateutil import parser
import datetime
import vim

try:
    result = parser.parse(' '.join(vim.eval("g:mline")))
    vim.command("let g:result = '" + result.strftime("[%Y-%m-%d]") + "'")
except:
    vim.command("let g:result = '[Unknown DT]'")
EOF
execute "normal! ddk"
put =g:result
endfunction

" Rounding: Precision rounding of floats {{{2
function! Rounding(selection) range
    let g:rounding = 1 * input('Round to how many decimals? ')
    if g:rounding < 0
        echo "Negative rounding not implemented at this time"
        return
    endif
    if a:selection == ""
        let g:selection = a:firstline . "," . a:lastline
    else
        let g:selection = a:selection
    endif
    execute g:selection . "s/\\d*\\.\\d\\+/" .
                \ "\\=printf('%." . g:rounding . "f', str2float(submatch(0)))/g"
endfunction

" Preserve: Execute a command while preserving history and cursor position {{{2
command! -nargs=* Preserve call Preserve("<args>")
function! Preserve(command)
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction

" OverLength Toggle: Toggle OverLength highlighting {{{2
function! OverLengthToggle()
    if exists('g:myoverlength_toggle')
        2match OverLength /\%81v.\+/
        unlet g:myoverlength_toggle
    else
        2match OverLength //
        let g:myoverlength_toggle = 1
    endif
endfunction

" Conceal Mappings: Toggle conceal level {{{2
function! ConcealLevelToggle()
    if &conceallevel == 0
        setl conceallevel=2
        echo "Conceal blocks displayed as characters"
    else
        setl conceallevel=0
        echo "Conceal blocks displayed raw"
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
" https://github.com/timcharper/wordnet.vim/blob/master/plugin/wordnet.vim
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
