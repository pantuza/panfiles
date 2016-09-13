


" {{{ Init

"
" Checks if the plugin is already loaded
"
if exists('tagboy_is_in_da_house')
    finish
endif

let g:tagboy_is_in_da_house = 1

" }}}


function! TagBoyLoad()

    echom "Hey baddy"
endfunction

autocmd FileType * call TagBoyLoad()
