
"""
" Function to parse the VIM modes. If in InsertMode the statusline color is
" green. If in VisualMode the statusline color is red. Else, generally in
" NormalMode, the statusline color is blue
function! statusline#EditorModeParser()
    if mode() == 'i'
        highlight StatusLine ctermfg=darkgreen ctermbg=black
    elseif mode() == 'v'
        highlight StatusLine ctermfg=red ctermbg=black
    else
        highlight StatusLine ctermfg=blue ctermbg=white
    endif
endfunction
