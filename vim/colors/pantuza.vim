

" Sets the color scheme name
let g:colors_name="pantuza"


set background=light


"
" Editor
"

" Sets line number colors to gray
highlight LineNr ctermfg=102 ctermbg=236

" Highlights the cursor line
highlight CursorLine cterm=None term=None ctermbg=236

" Highlights the 80th column
highlight ColorColumn ctermbg=236

" Parentesis matching
hi MatchParen guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=1 ctermbg=NONE cterm=bold


" C Code

" Primitive types
hi Type guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold

" Statements like if, while, for, etc..
hi Statement guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=Brown ctermbg=NONE cterm=bold
