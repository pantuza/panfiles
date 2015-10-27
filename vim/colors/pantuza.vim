"
"
" This color scheme is based on following template project:
" https://github.com/Heldraug/Vim-Colorscheme-Template
"
"


" Sets the color scheme name
let g:colors_name="pantuza"


set background=light


"
" Editor
"

" Sets line number colors to gray
highlight LineNr ctermfg=Black ctermbg=Gray

" Highlights the Vertical split bar
highlight VertSplit ctermbg=black ctermfg=black cterm=bold

" Highlights the cursor line
highlight CursorLine cterm=None term=None ctermbg=236

" Highlights the 80th column
highlight ColorColumn ctermbg=236

" Parentesis matching
hi MatchParen guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=Red ctermbg=NONE cterm=bold



" C Code

" Primitive types
hi Type guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=DarkBlue ctermbg=NONE cterm=bold

" Statements like if, while, for, etc..
hi Statement guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=Brown ctermbg=NONE cterm=bold

" Comments color
hi Comment guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic ctermfg=DarkGray ctermbg=NONE cterm=NONE

" Function names
hi Function guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=DarkCyan ctermbg=NONE

" Completion menu colors
hi PMenu ctermfg=Black ctermbg=LightYellow
hi PMenuSel ctermbg=DarkYellow ctermfg=Black
hi PMenuThumb ctermbg=White
hi PMenuSBar ctermbg=DarkGray

" Search colors
hi Search ctermfg=Black ctermbg=Gray
