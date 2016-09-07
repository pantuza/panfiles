

"""
" Asks operating system for OS name using uname posix tool
"
function! os#GetOS()

    return system("uname")
endfunction
