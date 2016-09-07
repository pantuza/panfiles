
"""
" This function is responsible of creating and updating tags files
" using ctags.
"


"
" Creates tags
"
function! tags#CreateTags()

   let cwd = getcwd()
   let tagsfile = cwd . "/tags"

   if !filereadable(tagsfile)
       " TODO: Create function to check language specific path to compute tags
       let python_library_path = $VIRTUAL_ENV

       let cmd = "ctags -R -f " . tagsfile . " " . cwd . " " . python_library_path
       let result = system(cmd)
   endif
endfunction


"
" Deletes tags
"
function! tags#DeleteTags(tagsfile, editedfile)

    let tagsfile = a:tagsfile
    let editedfile = a:editedfile

    let cmd = "sed -i '/" . escape(editedfile, "/") . "/d' " . tagsfile
    echom cmd
    "let result = system(cmd)
endfunction


"
" Updates tags (appends tags from edited file)
"
function! tags#UpdateTags()

   let editedfile = expand('%:p')
   let cwd = getcwd()

   let tagsfile = cwd . "/tags"
   call tags#DeleteTags(tagsfile, editedfile)

   let cmd = "ctags " . editedfile . " --append " . tagsfile
   let result = system(cmd)
endfunction
