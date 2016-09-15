
"""
" This functions are responsible of creating and updating tags files
" using ctags.
"


"
" Set ctags variables for languages
"
function! tags#SetVariables()

    if &filetype == "python"
        let s:ctagsparams = "--python-kinds=-iv --exclude=build --exclude=dist"
        let s:useTags = 1
    else
        let s:useTags = 0
    endif
endfunction


"
" Creates tags
"
function! tags#CreateTags()

    call tags#SetVariables()
    if !s:useTags
        return
    endif

    let cwd = getcwd()
    let tagsfile = cwd . "/tags"

    if !filereadable(tagsfile)
       " TODO: Create function to check language specific path to compute tags
       let python_library_path = $VIRTUAL_ENV

       let cmd = "ctags -R " . s:ctagsparams . " -f " . tagsfile . " " . cwd . " " . python_library_path . " &"
       let result = system(cmd)
    endif
endfunction


"
" Deletes tags
"
function! tags#DeleteTags(tagsfile, editedfile)

    let tagsfile = a:tagsfile
    let editedfile = a:editedfile

    let sedParamCompatibility = ""
    if os#IsOSX()
        let sedParamCompatibility = "''"
    endif

    let cmd = "sed -i " . sedParamCompatibility . " '/" . escape(editedfile, "/") . "/d' " . tagsfile
    let result = system(cmd)
endfunction


"
" Updates tags (appends tags from edited file)
"
function! tags#UpdateTags()

    call tags#SetVariables()
    if !s:useTags
        return
    endif

    let editedfile = expand('%:p')
    let cwd = getcwd()

    let tagsfile = cwd . "/tags"
    call tags#DeleteTags(tagsfile, editedfile)

    let cmd = "ctags " . "--append " . tagsfile . " " . editedfile . " &"
    let result = system(cmd)
endfunction
