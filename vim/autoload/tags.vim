
"""
" This function is responsible of creating and updating tags files
" using ctags.
"


"
" Update tags
"
function! tags#UpdateTags()

   let cwd = getcwd()
   let tagsfile = cwd . "/tags"

   " TODO: Create function to check language specific path to compute tags
   let python_library_path = $VIRTUAL_ENV

   let cmd = "ctags -R -f " . tagsfile . " " . cwd . " " . python_library_path
   let result = system(cmd)
endfunction
