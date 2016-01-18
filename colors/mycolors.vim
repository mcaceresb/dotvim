" Vim color scheme
"
" Name:         mycolors.vim
" Maintainer:   Mauricio Caceres
" License:      public domain
" Version:      0.1
" Note:         This was shamelessly based on Drew Neil's textmate.vim

set background=light
highlight clear

if exists("syntax_on")
  syntax reset
endif

set background=light
highlight clear

let g:colors_name = "mycolors"

" Colors: {{{1
let s:black           = '#000000'
let s:blue_grey       = '#3C4C72'
let s:dark_blue       = '#0000A2'
let s:dark_purple     = '#7F00FF'
let s:blue            = '#1E39F6'
let s:light_blue      = '#0066FF'
let s:light_purple    = '#6E79F1'
let s:blue_green      = '#318495'
let s:dark_green      = '#007B22'
let s:light_green     = '#00BC41'
let s:burgundy        = '#990000'
let s:redred          = '#D51015'
let s:pink            = '#E18AC7'
let s:orange          = '#FFCE77'
let s:light_orange    = '#FFE6BB'
let s:verylight_blue  = '#C6DEFF'
let s:grey_lines      = '#808080'
let s:grey_vsplit     = '#CFCFCF'
let s:grey_invisibles = '#DFDFDF'
let s:grey_statusline = '#EFEFEF'
let s:grey_cursorline = '#F0F6FF'
let s:white           = '#FFFFFF'
let s:matte_blue      = '#7EC0EE'
let s:matte_red       = '#BE646C'

" GUI: {{{1
exe 'highlight Cursor         guifg='.s:white           .' guibg='.s:blue_grey
exe 'highlight Visual         guibg='.s:verylight_blue
exe 'highlight CursorLine     guibg='.s:grey_cursorline
exe 'highlight CursorColumn   guibg='.s:grey_statusline
exe 'highlight StatusLine     guibg='.s:grey_statusline .' guifg='.s:blue_grey .' gui=italic,bold'
exe 'highlight StatusLineNC   guibg='.s:verylight_blue  .' guifg='.s:blue_grey

exe 'highlight LineNr         guibg='.s:grey_statusline .' guifg='.s:grey_lines
exe 'highlight VertSplit      guibg='.s:grey_vsplit     .' guifg='.s:white
exe 'highlight MatchParen     guifg='.s:blue            .' gui=bold,italic'
exe 'highlight Pmenu          guibg='.s:grey_statusline
exe 'highlight PmenuSel       guibg='.s:verylight_blue
exe 'highlight Directory      guifg='.s:redred          .' gui=bold'
exe 'highlight Folded         guibg='.s:white           .' guifg='.s:light_blue
exe 'highlight IncSearch      guibg='.s:orange
exe 'highlight Search         guibg='.s:light_orange

" Syntax: {{{1
exec 'highlight  Normal       guifg='.s:black        .' guibg='.s:white
exec 'highlight  Boolean      guifg='.s:light_purple .' gui=bold'
exec 'highlight  Character    guifg='.s:redred       .' gui=bold'
exec 'highlight  Conditional  guifg='.s:blue         .' gui=bold'
exec 'highlight  Constant     guifg='.s:redred       .' gui=bold'
exec 'highlight  Define       guifg='.s:blue         .' gui=bold'
exec 'highlight  ErrorMsg     guifg='.s:white        .' guibg='.s:burgundy
exec 'highlight  WarningMsg   guifg='.s:white        .' guibg='.s:burgundy
exec 'highlight  Float        guifg='.s:dark_blue
exec 'highlight  Function     guifg='.s:dark_blue    .' gui=bold'
exec 'highlight  Identifier   guifg='.s:blue         .' gui=bold'
exec 'highlight  Keyword      guifg='.s:blue         .' gui=bold'
exec 'highlight  Label        guifg='.s:dark_green
exec 'highlight  Number       guifg='.s:dark_blue
exec 'highlight  Operator     guifg='.s:blue         .' gui=bold'
exec 'highlight  PreProc      guifg='.s:blue         .' gui=bold'
exec 'highlight  Special      guifg='.s:black
exec 'highlight  Statement    guifg='.s:blue         .' gui=bold'
exec 'highlight  StorageClass guifg='.s:blue         .' gui=bold'
exec 'highlight  String       guifg='.s:dark_green
exec 'highlight  Title        guifg='.s:black        .' gui=bold'
exec 'highlight  Todo         guifg='.s:light_blue   .' gui=inverse,bold,italic'
exec 'highlight  Delimiter    guifg='.s:dark_purple
exec 'highlight  Error        guifg='.s:redred       .' gui=bold,italic guibg=#FFFFEF'

" Specifics: {{{1
exec 'highlight stataLocal       guifg='.s:matte_blue .' gui=bold'
exec 'highlight stataGlobal      guifg='.s:matte_red  .' gui=bold'
exec 'highlight vimNotation      guifg='.s:dark_purple
exec 'highlight vimGroup         guifg='.s:dark_green .' gui=bold'
exec 'highlight vimCommentTitle  guifg='.s:blue_grey  .' gui=bold'
exec 'highlight helpSpecial      guifg='.s:dark_purple
exec 'highlight link             vimHiGroup           vimGroup'
exec 'highlight markdownBold     gui=bold'
exec 'highlight markdownItalic   gui=italic'
exec 'highlight markdownCode     guifg='.s:dark_green
exec 'highlight link             markdownCodeBlock    markdownCode'
exec 'highlight texMathZoneW     guifg='.s:dark_purple
exec 'highlight texMathZoneX     guifg='.s:dark_purple
exec 'highlight texBeginEndName  gui=Italic'
exec 'highlight texItalStyle     gui=Italic'
exec 'highlight texBoldStyle     gui=Bold'
exec 'highlight texBoldItalStyle gui=Bold,Italic'
exec 'highlight sasMacroVar      guifg='.s:dark_purple .' gui=bold'
exec 'highlight link texBeginEndName Normal'

" Misc {{{1
exec 'highlight BT1   guifg='.s:grey_lines  .' gui=italic'
exec 'highlight OL1   guifg='.s:black       .' gui=bold'
exec 'highlight OL2   guifg='.s:dark_purple .' gui=bold'
exec 'highlight OL3   guifg='.s:dark_green  .' gui=bold'
exec 'highlight OL4   guifg='.s:light_purple
exec 'highlight NonText    guifg='.s:grey_invisibles .' guibg='.s:white
exec 'highlight SpecialKey guifg='.s:grey_invisibles .' guibg='.s:white
" highlight ColorColumn ctermbg=red ctermfg=white guibg=#FFD3D3
highlight Comment cterm=italic gui=italic guifg=grey50
highlight OverLength ctermbg=red ctermfg=white guibg=#FFD3D3
highlight ExtraWhitespace ctermbg=red guibg=#FFD3D3
match ExtraWhitespace /\s\+$/
2match OverLength /\%80v.\+/

" Diff styles {{{1
hi   diffAdded     guifg=#007B22   guibg=#FFFFFF   ctermfg=28    ctermbg=15
hi   diffRemoved   guifg=#D51015   guibg=#FFFFFF   ctermfg=160   ctermbg=15
hi   diffFile      guifg=#6E79F1   guibg=#FFFFFF   ctermfg=69    ctermbg=15
hi   diffNewFile   guifg=#6E79F1   guibg=#FFFFFF   ctermfg=69    ctermbg=15
hi   diffLine      guifg=#000000   guibg=#FFFFFF   ctermfg=0     ctermbg=15
hi   diffAdd       guifg=#007B22   guibg=#FFFFFF   ctermfg=28    ctermbg=15
hi   diffChange    guifg=#007B22   guibg=#FFFFFF   ctermfg=28    ctermbg=15
hi   diffText      guifg=#007B22   guibg=#FFFFFF   ctermfg=28    ctermbg=15
hi   link diffDelete diffRemoved

" Git styles {{{1
hi   gitcommitFirstLine       guifg=#000000            guibg=#FFFFFF            ctermfg=0     ctermbg=15
hi   gitcommitSelectedType    guifg=#007B22            guibg=#FFFFFF            ctermfg=28    ctermbg=15
hi   link                     gitcommitSelectedFile    gitcommitSelectedType
hi   gitcommitDiscardedType   guifg=#D51015            guibg=#FFFFFF            ctermfg=160   ctermbg=15
hi   link                     gitcommitDiscardedFile   gitcommitDiscardedType
hi   gitcommitUntrackedFile   guifg=#6E79F1            guibg=#FFFFFF            ctermfg=69    ctermbg=15

" Ruby styles {{{1
hi   rubyClass                         guifg=#1E39F6   ctermfg=27    gui=bold
hi   rubyFunction                      guifg=#0000A2   ctermfg=19    gui=bold
hi   rubyInterpolationDelimiter        guifg=#00BC41   ctermfg=35
hi   rubyInterpolation                 guifg=#00BC41   ctermfg=35
hi   rubySymbol                        guifg=#D51015   ctermfg=160   gui=bold
hi   rubyConstant                      guifg=#6E79F1   ctermfg=69    gui=bold
hi   rubyStringDelimiter               guifg=#007B22   ctermfg=28
hi   rubyInstanceVariable              guifg=#318495   ctermfg=66
hi   rubyInclude                       guifg=#1E39F6   ctermfg=27    gui=bold
hi   rubyGlobalVariable                guifg=#318495   ctermfg=66
hi   rubyRegexp                        guifg=#E18AC7   ctermfg=176
hi   rubyRegexpAnchor                  guifg=#E18AC7   ctermfg=176
hi   rubyRegexpQuantifier              guifg=#E18AC7   ctermfg=176
hi   rubyRegexpParens                  guifg=#E18AC7   ctermfg=176
hi   rubyRegexpEscape                  guifg=#00BC41   ctermfg=35
hi   rubyRegexpCharClass               guifg=#00BC41   ctermfg=35
hi   rubyRegexpDelimiter               guifg=#E18AC7   ctermfg=176
hi   rubyEscape                        guifg=#00BC41   ctermfg=35
hi   rubyControl                       guifg=#1E39F6   ctermfg=27    gui=bold
hi   rubyOperator                      guifg=#1E39F6   ctermfg=27    gui=bold
hi   rubyException                     guifg=#1E39F6   ctermfg=27    gui=bold
hi   rubyPseudoVariable                guifg=#318495   ctermfg=66
hi   rubyRailsUserClass                guifg=#6E79F1   ctermfg=69    gui=bold
hi   rubyRailsARAssociationMethod      guifg=#3C4C72   ctermfg=240   gui=bold
hi   rubyRailsARMethod                 guifg=#3C4C72   ctermfg=240   gui=bold
hi   rubyRailsRenderMethod             guifg=#3C4C72   ctermfg=240   gui=bold
hi   rubyRailsMethod                   guifg=#3C4C72   ctermfg=240   gui=bold
hi link erubyComment Comment
hi erubyRailsMethod  guifg=#3C4C72 ctermfg=240 gui=bold

" XML: {{{1
hi link xmlEndTag xmlTag

" HTML: {{{1
hi   htmlTag                         guifg=#1E39F6   ctermfg=27
hi   link              htmlEndTag    htmlTag
hi   link              htmlTagName   htmlTag
hi   link              htmlArg       htmlTag
hi   htmlSpecialChar                 guifg=#D51015   ctermfg=160   gui=bold
hi   htmlH1            gui=bold
hi   link              htmlH2        htmlH1
hi   link              htmlH3        htmlH1
hi   link              htmlH4        htmlH1
hi   link              htmlH5        htmlH1
hi   link              htmlH6        htmlH1

" JavaScript: {{{1
hi   javaScriptFunction           guifg=#1E39F6   ctermfg=27    gui=bold
hi   javaScriptFuncName           guifg=#318495   ctermfg=66    gui=italic
hi   javaScriptLabel              guifg=#0000A2   ctermfg=19    gui=bold
hi   javaScriptRailsFunction      guifg=#3C4C72   ctermfg=240   gui=bold
hi   javaScriptType               guifg=#318495   ctermfg=66    gui=none
hi   javaScriptArgument           guifg=#318495   ctermfg=66    gui=italic
hi   javaScriptRegexpString       guifg=#E18AC7   ctermfg=176   gui=NONE
hi   javaScriptSpecial            guifg=#00BC41   ctermfg=35    gui=NONE

" YAML: {{{1
hi   yamlAnchor              guifg=#318495   ctermfg=66
hi   yamlAlias               guifg=#318495   ctermfg=66
hi   yamlDocumentHeader      guibg=#F2F2F2   ctermbg=7

" CSS: {{{1
hi   cssTagName                                  gui=bold
hi   cssIdentifier                               gui=italic
hi   link              cssClassName              cssIdentifier
hi   cssDefinition                               guifg=#6E79F1   ctermfg=69
hi   link              cssRenderProp             cssDefinition
hi   link              cssTextProp               cssDefinition
hi   link              cssFontProp               cssDefinition
hi   link              cssColorProp              cssDefinition
hi   link              cssBoxProp                cssDefinition
hi   link              cssGeneratedContentProp   cssDefinition
hi   link              cssUIProp                 cssDefinition
hi   cssCommonAttr                               guifg=#00BC41   ctermfg=35
hi   link              cssAttr                   cssCommonAttr
hi   link              cssRenderAttr             cssCommonAttr
hi   link              cssTextAttr               cssCommonAttr
hi   link              cssFontAttr               cssCommonAttr
hi   link              cssGeneratedContentAttr   cssCommonAttr
hi   cssURL                                      guifg=#007B22   ctermfg=28
hi   cssFunctionName                             guifg=#3C4C72   ctermfg=240   gui=bold
hi   cssColor                                    guifg=#D51015   ctermfg=160   gui=bold
hi   cssValueLength                              guifg=#0000A2   ctermfg=19
hi   cssImportant                                guifg=#1E39F6   ctermfg=27    gui=bold

" Modelines: {{{1
" vim: nowrap fdm=marker
" }}}
