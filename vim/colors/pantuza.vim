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
highlight LineNr ctermfg=Gray ctermbg=233

" Highlights the Vertical split bar
highlight VertSplit ctermbg=black ctermfg=black cterm=bold

" Highlights the cursor line
highlight CursorLine cterm=None term=None ctermbg=233

" Highlights the 80th column
highlight ColorColumn ctermbg=233

" Parentesis matching
highlight MatchParen guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=Red ctermbg=NONE cterm=bold

" Tab line colors
highlight TabLineFill ctermfg=33

" Tabs of opened files
highlight TabLine ctermbg=33 ctermfg=black

" Selected tab color
highlight TabLineSel ctermfg=232 ctermbg=227

" Tab label colors
highlight Title ctermfg=Yellow ctermbg=232 gui=bold




""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM SYMBOLS
"
syn keyword pythonBoolean True False



" C Code

" Primitive types
highlight Type guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=DarkBlue ctermbg=NONE cterm=bold

" Structures (struct)
highlight Structure guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=DarkBlue ctermbg=NONE cterm=bold

" Statements like while, for, etc..
highlight Statement guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=Brown ctermbg=NONE cterm=bold

" Conditionals like if
highlight Conditional guifg=#BD9800 guibg=NONE guisp=NONE gui=bold ctermfg=Brown ctermbg=NONE cterm=bold

" Comments color
highlight Comment guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic ctermfg=DarkGray ctermbg=NONE cterm=NONE

" Function names
highlight Function guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=60 ctermbg=NONE cterm=bold

" Identifiers
highlight Identifier guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=DarkCyan ctermbg=NONE cterm=NONE

" String colors
highlight String ctermfg=DarkRed

" Keywords colors
highlight Keyword ctermfg=DarkYellow

" Boolean values
highlight Boolean ctermfg=Yellow

" Operators like 'new'
highlight Operator ctermfg=DarkCyan cterm=NONE

" Constants like file descriptors, etc
highlight Constant ctermfg=red cterm=bold

" Numbers like integers
highlight Number ctermfg=green cterm=bold

" Float numbers like double C numbers
highlight Float ctermfg=green cterm=bold

" Color for whitespaces listchars
highlight SpecialKey ctermfg=white cterm=bold

" Colors for import reserved keys
highlight Include ctermfg=DarkMagenta cterm=NONE

" Storage classes like static, const, volatile, register
highlight StorageClass ctermfg=blue ctermbg=NONE cterm=NONE

" Macro definitions like define
highlight Macro ctermfg=DarkMagenta ctermbg=black



" Completion menu colors
highlight PMenu ctermfg=Black ctermbg=LightYellow
highlight PMenuSel ctermbg=DarkYellow ctermfg=Black
highlight PMenuThumb ctermbg=White
highlight PMenuSBar ctermbg=DarkGray

" Search colors
highlight Search ctermfg=Black ctermbg=Gray
highlight IncSearch ctermfg=Black ctermbg=Yellow term=NONE cterm=NONE gui=NONE

" Visual selection color
highlight Visual ctermbg=236 ctermfg=NONE cterm=NONE



" Filesystem

" Directories colors
highlight Directory guifg=#536991 guibg=NONE guisp=NONE gui=bold ctermfg=DarkBlue ctermbg=NONE cterm=bold

" Nerdtree executable files
highlight NERDTreeExecFile ctermfg=green


"
" Python code highlights
"

" try except statements
highlight pythonException ctermfg=DarkYellow

" Escape character
highlight pythonEscape ctermfg=DarkMagenta

" Boolean values (True, False)
highlight pythonBoolean ctermfg=Yellow cterm=bold


"
" Html colors
"
highlight htmlH1 ctermfg=white

highlight htmlTag ctermfg=60 cterm=bold
highlight htmlEndTag ctermfg=60 cterm=bold



"
" Markdown colors
"
highlight markdownH1 ctermfg=white cterm=bold
highlight markdownH2 ctermfg=white cterm=bold
highlight markdownH3 ctermfg=white cterm=bold
highlight markdownH4 ctermfg=white cterm=bold
highlight markdownH5 ctermfg=white cterm=bold
highlight markdownH6 ctermfg=white cterm=bold


"
" Colors for error/warning/info messages
"
highlight SpellBad ctermbg=red ctermfg=black
highlight SpellCap ctermbg=red ctermfg=black
