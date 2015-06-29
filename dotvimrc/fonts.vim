"-----------------------------------------------------------------------------
" Project: dotvim
" Program: fonts.vim
" Purpose: Fonts and colorscheme mappings
" Updated: Sat 27 Jun 2015 12:03:46 AM EDT
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>
"
" Inputs:  It creates shortcuts for the following (gui) fonts
"   Droid Sans Mono
"   Ubuntu Mono
"   Inconsolata
"   Monospace
"   Consolas
"   Source Code Pro Regular (default)
"   Inconsolata-g

" Look: Set up font and color scheme {{{1
"------------------------------------------------

" Set font
if has("gui_running")
    if has("gui_gtk2")
        set guifont=Droid\ Sans\ Mono\ 9
        set guifont=Inconsolata\ Medium\ 11
        set guifont=Ubuntu\ Mono\ 11
        set guifont=Source\ Code\ Pro\ Regular\ 9
    elseif has("gui_win32")
        set guifont=Consolas:h11:cANSI
    endif
endif

" Shortcuts to other fonts
nnoremap <leader>f1 :set guifont=Droid\ Sans\ Mono\ 9<CR>
nnoremap <leader>f2 :set guifont=Ubuntu\ Mono\ 10<CR>
nnoremap <leader>f3 :set guifont=Inconsolata\ 9<CR>
nnoremap <leader>f4 :set guifont=Monospace\ 9<CR>
nnoremap <leader>f5 :set guifont=Consolas\ 11<CR>
nnoremap <leader>f6 :set guifont=Source\ Code\ Pro\ Regular\ 10<CR>
nnoremap <leader>f7 :set guifont=Inconsolata-g\ Medium\ 9<CR>

" Toggle Colors: Toggle color scheme {{{1
nnoremap z, :call ColorSchemeToggle()<CR>

" Toggle color scheme
function! ColorSchemeToggle()
    if exists('g:mycolor_toggle')
        colorscheme mycolors
        set guifont=Source\ Code\ Pro\ Regular\ 9
        nnoremap <leader>f1 :set guifont=Droid\ Sans\ Mono\ 10<CR>
        nnoremap <leader>f2 :set guifont=Ubuntu\ Mono\ 11<CR>
        nnoremap <leader>f3 :set guifont=Inconsolata\ 11<CR>
        nnoremap <leader>f4 :set guifont=Monospace\ 9<CR>
        nnoremap <leader>f5 :set guifont=Consolas\ 11<CR>
        nnoremap <leader>f6 :set guifont=Source\ Code\ Pro\ Regular\ 9<CR>
        nnoremap <leader>f7 :set guifont=Inconsolata-g\ Medium\ 9<CR>
        unlet g:mycolor_toggle
        echo 'Color scheme set to light. Font shortcuts changed.'
    else
        colorscheme twilight
        set guifont=Source\ Code\ Pro\ Regular\ 9
        nnoremap <leader>f1 :set guifont=Droid\ Sans\ Mono\ 10<CR>
        nnoremap <leader>f2 :set guifont=Ubuntu\ Mono\ 12<CR>
        nnoremap <leader>f3 :set guifont=Inconsolata\ 12<CR>
        nnoremap <leader>f4 :set guifont=Monospace\ 10<CR>
        nnoremap <leader>f5 :set guifont=Consolas\ 11<CR>
        nnoremap <leader>f6 :set guifont=Source\ Code\ Pro\ Regular\ 10<CR>
        nnoremap <leader>f7 :set guifont=Inconsolata-g\ Medium\ 10<CR>
        let g:mycolor_toggle = 1
        echo 'Color scheme set to dark. Font shortcuts changed.'
    endif
endfunction

" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}
