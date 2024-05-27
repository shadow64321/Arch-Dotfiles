*Everything is case sensitive*

# General
    - <C-p> = fuzzy find files in cwd
    - <leader>fg = live grep (in current file)
    - <Shift>(<,>) = Indents in arrow direction
    - 'K' = hover info (like vscode)
    - 'gd' = gets definition
    - '<leader>ca' = code action/autocomplete
    - 'dw' = delete word
    - '*' = find all matches of a word
        - n = Index forward though matches
        - N = Index backward though matches
    - ':%s/"Word"/"Replacement"/gc' = finds and replaces a word the g at the end is for global and will replace all matches in file and the c is for check so it will check which ones you wnat to replace
    - 'v+i+w' = select word
    - 'c+i+w' = replace word
    - ':reg' = show all previusly yanked things
    - 'd' = delete word an place in register to paste
    - ' "+(regnum)+p ' = paste the contents of the 3rd register
    - ' "+(regnum)+y ' = yank to regnum
    - '"+y' = note the '+' is acctually typed, will send data to system clipboard

# Macros
    - "q+(regnum)" = starts recording a macro
    - "q" = ends recording of macro
    - "@(regnum)" = playback macro
    - "(num)@(regnum)" = plays macro (num) times

# Neotree - Invoke: <C-n>
    - a = Create File
    - i = file/folder info
