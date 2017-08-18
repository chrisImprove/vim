# VIM 自带快捷键的使用方法

### motion
    %
        Find the next item in this line after or under the cursor and jump to its match  <br>
    [[
        sections forward or to the next '{' in the first column.  <br>
        When used after an operator, then also stops below a '}' in the first column.
    gD
        Goto global Declaration.  When the cursor is on a global variable that is defined in the file,
        this command will jump to its declaration.
    ''
        jump to the previous postion
    mx
        create bookmarks   x must a/z A/Z
    `x 'x
        jump to the bookmark x
    [count]> / [count]<
        Increased / less indented


### tab
	:tabnew [++opt选项] ［＋cmd］ 文件      建立对指定文件新的tab
	:tabc   
	:tabo
        close the other tab
	:tabsl
        list all opened tab
	:tabp
        previous tab
	:tabn
        next tab
	gT/gt
        go the previous/next tab


### buffer
    :ls
        list all buffers
        1 #  "shell1.sh"  /  2 %a "shell2.sh"   /3    "shell.sh" 
    :bn/bnext bp
        switch to next/previos buffer
    :bdelete N1,N2,N3
        delete N1,N2,N3 buffer
    :N,M bdelete
        delete buffers form num n to m 
    :buffer{bufname}
    :buffer N
        jump to the specific buffer
    :bd
        close the current buffer, and the file also closed.
    Ctrl + ^ : 
         % visible in the current window, # the rotation file.
        switch in % and # buffer.


### .vimrc中快捷键  
    Normal Model: 
        [count]J :
            Join [count] lines, with a minimum of two lines. Remove the indent and insert up to two spacesbelow)

    nnoremap Y y$:
        [count]Y :
            Copy [count] lines.

    cmap w!! w !sudo tee % >/dev/null
        <w!!>
            For when you forget to sudo.. Really Write the file.

    cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
    map <leader>ew :e %%
    map <leader>es :sp %%
    map <leader>ev :vsp %%
    map <leader>et :tabe %%
       Some helpers to edit mode

    map <Leader>= <C-w>=
        adjust viewports to the same size

    nmap <Leader>ff [I:let nr = input("Which one: ")<Bar>exe "normal " . nr ."[\t"<CR>
        Map <Leader>ff to display all lines with keyword under cursor and ask which one to jump to

    set list/nolist
        how/hide tab and space

    set cursorline/cursorcolumn:
        highlight current line/column
