"-----------------------------------------------------------------------------
" Project: dotvim
" Program: conceal.vim
" Purpose: Settings specific to the conceal feature
" Updated: Wed 03 Jun 2015 01:54:02 AM EDT
" Author:  Mauricio Caceres <mauricio.caceres.bravo@gmail.com>

" Conceal Mappings: Toggle conceal level {{{1
nnoremap <Leader>h :call ConcealLevelToggle()<CR>
inoremap <Leader><Leader>h <ESC>:call ConcealLevelToggle()<CR>a
function! ConcealLevelToggle()
    if &conceallevel == 0
        setl conceallevel=2
        echo "Conceal blocks displayed as characters"
    else
        setl conceallevel=0
        echo "Conceal blocks displayed raw"
    endif
endfunction

" Greek Letters: Conceal Greek alphabet {{{1
syntax match texStatement '\\Alpha'    contained conceal cchar=Α
syntax match texStatement '\\alpha'    contained conceal cchar=α
syntax match texStatement '\\Beta'     contained conceal cchar=Β
syntax match texStatement '\\beta'     contained conceal cchar=β
syntax match texStatement '\\Gamma'    contained conceal cchar=Γ
syntax match texStatement '\\gamma'    contained conceal cchar=γ
syntax match texStatement '\\Delta'    contained conceal cchar=Δ
syntax match texStatement '\\delta'    contained conceal cchar=δ
syntax match texStatement '\\Epsilon'  contained conceal cchar=Ε
syntax match texStatement '\\epsilon'  contained conceal cchar=ε
syntax match texStatement '\\Zeta'     contained conceal cchar=Ζ
syntax match texStatement '\\zeta'     contained conceal cchar=ζ
syntax match texStatement '\\Eta'      contained conceal cchar=Η
syntax match texStatement '\\eta'      contained conceal cchar=η
syntax match texStatement '\\Theta'    contained conceal cchar=Θ
syntax match texStatement '\\theta'    contained conceal cchar=θ
syntax match texStatement '\\Iota'     contained conceal cchar=Ι
syntax match texStatement '\\iota'     contained conceal cchar=ι
syntax match texStatement '\\Kappa'    contained conceal cchar=Κ
syntax match texStatement '\\kappa'    contained conceal cchar=κ
syntax match texStatement '\\Lambda'   contained conceal cchar=Λ
syntax match texStatement '\\lambda'   contained conceal cchar=λ
syntax match texStatement '\\Mu'       contained conceal cchar=Μ
syntax match texStatement '\\mu'       contained conceal cchar=μ
syntax match texStatement '\\Nu'       contained conceal cchar=Ν
syntax match texStatement '\\nu'       contained conceal cchar=ν
syntax match texStatement '\\Xi'       contained conceal cchar=Ξ
syntax match texStatement '\\xi'       contained conceal cchar=ξ
syntax match texStatement '\\Omicron'  contained conceal cchar=Ο
syntax match texStatement '\\omicron'  contained conceal cchar=ο
syntax match texStatement '\\Pi'       contained conceal cchar=Π
syntax match texStatement '\\pi'       contained conceal cchar=π
syntax match texStatement '\\Rho'      contained conceal cchar=Ρ
syntax match texStatement '\\rho'      contained conceal cchar=ρ
syntax match texStatement '\\Sigma'    contained conceal cchar=Σ
syntax match texStatement '\\sigma'    contained conceal cchar=σ
syntax match texStatement '\\varsigma' contained conceal cchar=ς
syntax match texStatement '\\Tau'      contained conceal cchar=Τ
syntax match texStatement '\\tau'      contained conceal cchar=τ
syntax match texStatement '\\Upsilon'  contained conceal cchar=Υ
syntax match texStatement '\\upsilon'  contained conceal cchar=υ
syntax match texStatement '\\Phi'      contained conceal cchar=Φ
syntax match texStatement '\\phi'      contained conceal cchar=φ
syntax match texStatement '\\Chi'      contained conceal cchar=Χ
syntax match texStatement '\\chi'      contained conceal cchar=χ
syntax match texStatement '\\Psi'      contained conceal cchar=ψ
syntax match texStatement '\\psi'      contained conceal cchar=Ψ
syntax match texStatement '\\Omega'    contained conceal cchar=Ω

" LaTeX: Misc LaTeX conceals {{{1

" Conceal matches
syn match texGreek '\\varepsilon\>' contained conceal cchar=ε
syntax match texStatement  '\^\\prime'  contained conceal cchar=′
syntax match texStatement  '\^\*'  contained conceal cchar=*
syntax match texStatement '\\partial'  contained conceal cchar=∂
syntax match texStatement '\\widetilde{s}' contained conceal cchar=ŝ
syntax match texStatement '\\widehat{s}' contained conceal cchar=ŝ

" Math bold
syntax match texStatement '\\mathbb{R}' contained conceal cchar=ℝ

" Calligraphic
syntax match texStatement '\\mathcal{H}' contained conceal cchar=ℋ
syntax match texStatement '\\mathcal{L}' contained conceal cchar=ℒ

" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}
