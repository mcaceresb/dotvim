" ----------------------------------------------------------------------------
" Program: stata-jump-program.vim
" Author:  github.com/mcaceresb
" Created: Fri Jun 10 12:33:59 EDT 2016
" Updated: Tue Feb  7 23:55:38 EST 2017
" Purpose: Jump programs and use statements in Stata file
" Usage:   Specify a custom list of environments via g:Stata_jump_environments

if !exists("g:Stata_jump_environments")
    let g:Stata_jump_environments = ['^\s*program\s+', '^\s*use\s+', '^[a-z ]*function']
endif

" Adapted from LaTeX-Box ftplugin/latex-box/mappings.vim LatexBoxNextSection
function! s:StataNextSection(type, backwards, visual)
	" Restore visual mode if desired
	if a:visual
		normal! gv
	endif

	" For the [] and ][ commands we move up or down before the search
	if a:type == 1
		if a:backwards
			normal! k
		else
			normal! j
		endif
	endif

	" Define search pattern and do the search while preserving "/
	let save_search = @/
	let flags = 'W'
	if a:backwards
		let flags = 'b' . flags
	endif

	let pattern = '\v^\s*(' . join(g:Stata_jump_environments, '|') . ')\s'
	call search(pattern, flags)
	let @/ = save_search

	" For the [] and ][ commands we move down or up after the search
	if a:type == 1
		if a:backwards
			normal! j
		else
			normal! k
		endif
	endif
endfunction

noremap  <buffer> <silent> ]] :call <SID>StataNextSection(0,0,0)<CR>
noremap  <buffer> <silent> ][ :call <SID>StataNextSection(1,0,0)<CR>
noremap  <buffer> <silent> [] :call <SID>StataNextSection(1,1,0)<CR>
noremap  <buffer> <silent> [[ :call <SID>StataNextSection(0,1,0)<CR>
vnoremap <buffer> <silent> ]] :<c-u>call <SID>StataNextSection(0,0,1)<CR>
vnoremap <buffer> <silent> ][ :<c-u>call <SID>StataNextSection(1,0,1)<CR>
vnoremap <buffer> <silent> [] :<c-u>call <SID>StataNextSection(1,1,1)<CR>
vnoremap <buffer> <silent> [[ :<c-u>call <SID>StataNextSection(0,1,1)<CR>
