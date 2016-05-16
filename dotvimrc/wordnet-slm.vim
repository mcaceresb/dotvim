" ----------------------------------------------------------------------------
" Program: vimrc-functions
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>
" Created: Wed Jun  3 14:07:41 EDT 2015
" Updated: Sat May 14 17:55:24 EDT 2016
" Purpose: Mappings to functions or longer snippets

" WordNet word lookup
command! -nargs=+ Wn call WordNetOverviews("<args>")
command! -nargs=+ Wordnet call WordNetOverviews("<args>")

noremap <Leader>we "wyiw:call WordNetOverviews(@w,"-synsn")<CR>
noremap <Leader>wd "wyiw:call WordNetBrowse(@w,"-over")<CR>
noremap <Leader>ww "wyiw:call WordNetOverviews(@w,"-over")<CR>
noremap <Leader>wq "wyiw:call WordNetBrowse(@w,"-synsn")<CR>

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

