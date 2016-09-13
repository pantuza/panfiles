


" {{{ Init

"
" Checks if the plugin is already loaded
"
if exists('tagboy_is_in_da_house')
    finish
endif

let g:tagboy_is_in_da_house = 1

" }}}



" {{{ Configure the tagboy plugin

" Create tags for project if it does not exists during start up
autocmd VimEnter * call tags#CreateTags()

" Enable updating project tags after file writes
autocmd BufWritePost * call tags#UpdateTags()

" }}}
