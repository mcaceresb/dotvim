" Pencil is a pretty cool color scheme, but I'm used to a bit more
" boldness and less pink. I made these changes to it and it looks better
" to me. (NOTE: You only preferred this white and gray bc of red shift)

let s:light_blue_grey = { "gui": "#5B80A6", "cterm": "1"   }
let s:blue_grey       = { "gui": '#3C4C72', "cterm": "1"   }
let s:white           = { "gui": "#FFFFFF", "cterm": "15"  }
let s:lighter_gray    = { "gui": "#EEEFEF", "cterm": "251" }

if ! exists("g:pencil_bolder")
  let g:pencil_bolder = 0
endif

if &background == "dark"
  let s:bluez           = s:light_blue_grey
else
  let s:bluez           = s:blue_grey
endif

if g:pencil_bolder == 1
    call s:h("Statement", {"fg": s:green, "gui": "bold"})
    call s:h("PreProc",   {"fg": s:bluez, "gui": "bold"})
else
    call s:h("Statement", {"fg": s:green})
    call s:h("PreProc",   {"fg": s:bluez})
endif
