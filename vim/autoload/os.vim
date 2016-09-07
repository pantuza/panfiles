


"""
" Asks operating system for OS name using uname posix tool
"
function! os#GetOS()

    return system("uname")
endfunction



"""
" Checks if OS is OS X
"
function! os#IsOSX()

    return os#GetOS() == "Darwin"
endfunction



"""
" Checks if OS is Linux
"
function! os#IsLinux()

    return os#GetOS() == "Linux"
endfunction
