*************************************************************
*	Descirption	:	本文件解释Vim插件的使用方法				*
*	Author		:	CHRIS									*
*	Date		:	20160805								*
*************************************************************
" UI {
    vim-airline/vim-airline:
        :AirlineTheme {theme-name}
            Displays or changes the current theme.
        :AirlineToggleWhitespace
            Toggles whitespace detection.
        :AirlineToggle
            Toggles between the standard 'statusline' and airline.
        :AirlineRefresh
            Refreshes all highlight groups and redraws the statusline.
" }


General {
	nerdtree:
        o   :Open files, directories and bookmarks
        go  :Open selected file, but leave cursor in the NERDTree
        t   :Open selected node/bookmark in a new tab
        T   :Same as 't' but keep the focus on the current tab
        i   :Open selected file in a split window
        gi  :Same as i, but leave the cursor on the NERDTree
        s   :Open selected file in a new vsplit
        gs  :Same as s, but leave the cursor on the NERDTree
        O   :Recursively open the selected directory
        x   :Close the current nodes parent
        X   :Recursively close all children of the current node
        D   :Delete the current bookmark

        P   :Jump to the root node
        p   :Jump to current nodes parent
        K   :Jump up inside directories at the current tree depth
        J   :Jump down inside directories at the current tree depth
        <C-J>   :Jump down to the next sibling of the current directory
        <C-K>   :Jump up to the previous sibling of the current directory

        C   :Change the tree root to the selected dir
        u   :Move the tree root up one directory
        U   :Same as 'u' except the old root node is left open
        r   :Recursively refresh the current directory
        R   :Recursively refresh the current root
        m   :Display the NERD tree menu
        cd  :Change the CWD to the dir of the selected node
        CD  :Change tree root to the CWD

        I   :Toggle whether hidden files displayed
        f   :Toggle whether the file filters are used
        F   :Toggle whether files are displayed
        B   :Toggle whether the bookmark table is displayed

        q   :Close the NERDTree window
        A   :Zoom (maximize/minimize) the NERDTree window
        ?   :Toggle the display of the quick help

    nathanaelkane/vim-indent-guides:
        :IndentGuidesToggle
            Toggles the indent guides on and off.
        :IndentGuidesEnable
            Enables the indent guides for the current buffer and any other buffer upon entering it.
        :IndentGuidesDisable 
            Disables the indent guides for the current buffer and any other buffer upon entering it
			
	gcmt/wildfire.vim:
        Press `<ENTER>`         : in normal mode to select the closest text object
        pressing `2<ENTER>`     : will select the second closest textd$
        Keep pressing `<ENTER>` : selecting the **next** closest text object.
        Press `<BS>`            : select the **previously** selected text object, press `<BS>`.	
			
    matchit.zip:
        %   : Cycle forward through matching groups. such as "if", "else", "endif"
        g%  : Cycle backwards through matching groups
        [%  : Go to [count] previous unmatched group
        ]%	: Go to [count] next unmatched group
    
    vim-scripts/sessionman.vim:
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
        nmap <leader>sc :SessionClose<CR>

    easymotion/vim-easymotion:
        Note: The default leader has been changed to <Leader><Leader> to avoid conflicts with other plugins you may have installed
        Default Mapping      | Details
        ---------------------|----------------------------------------------
        <Leader>f{char}      | Find {char} to the right. See |f|.
        <Leader>F{char}      | Find {char} to the left. See |F|.
        <Leader>t{char}      | Till before the {char} to the right. See |t|.
        <Leader>T{char}      | Till after the {char} to the left. See |T|.
        <Leader>w            | Beginning of word forward. See |w|.
        <Leader>W            | Beginning of WORD forward. See |W|.
        <Leader>b            | Beginning of word backward. See |b|.
        <Leader>B            | Beginning of WORD backward. See |B|.
        <Leader>e            | End of word forward. See |e|.
        <Leader>E            | End of WORD forward. See |E|.
        <Leader>ge           | End of word backward. See |ge|.
        <Leader>gE           | End of WORD backward. See |gE|.
        <Leader>j            | Line downward. See |j|.
        <Leader>k            | Line upward. See |k|.
        <Leader>n            | Jump to latest "/" or "?" forward. See |n|.
        <Leader>N            | Jump to latest "/" or "?" backward. See |N|.
        <Leader>s            | Find(Search) {char} forward and backward.                             | See |f| and |F|.

        " <Leader>f{char} to move to {char}
        map  <Leader>f <Plug>(easymotion-bd-f)
        nmap <Leader>f <Plug>(easymotion-overwin-f)

        " s{char}{char} to move to {char}{char}
        nmap s <Plug>(easymotion-overwin-f2)

        " Move to line
        map <Leader>L <Plug>(easymotion-bd-jk)
        nmap <Leader>L <Plug>(easymotion-overwin-line)

        " Move to word
        map  <Leader>w <Plug>(easymotion-bd-w)
        nmap <Leader>w <Plug>(easymotion-overwin-w)
        
	terryma/vim-multiple-cursors:
        <C-n>   : start/select
        <C-x>   : jump over
        <C-p>   : the previous mapped
        Insert mode such as `c` or `s` from Visual mode or `i`, `a`, `I`, `A` in Normal mode
            should work without any issues. 

" }



" General Programming {
	tpope/vim-surround : 
		Usage:
			Old text                  Command     New text ~
			"Hello *world!"           ds"         Hello world!
			[123+4*56]/2              cs])        (123+456)/2
			"Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
			if *x>3 {                 ysW(        if ( x>3 ) {
			my $str = *whee!;         vllllS'     my $str = 'whee!';

			Old text                  Command     New text ~
			"Hello *world!"           cs"'        'Hello world!'
			"Hello *world!"           cs"<q>      <q>Hello world!</q>
			(123+4*56)/2              cs)]        [123+456]/2
			(123+4*56)/2              cs)[        [ 123+456 ]/2
			<div>Yo!*</div>           cst<p>      <p>Yo!</p>		
			ysiw  + [字符]  	设置字符串: snipmate[ysiw'] -> 'snipmate'
	vim-repeat [快速加环绕符] 
			repeat进行增强,'.'可以重复命令
	
	godlygeek/tabular:
		nmap <Leader>a& :Tabularize /&<CR>
		vmap <Leader>a& :Tabularize /&<CR>
		nmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
		vmap <Leader>a= :Tabularize /^[^=]*\zs=<CR>
		nmap <Leader>a=> :Tabularize /=><CR>
		vmap <Leader>a=> :Tabularize /=><CR>
		nmap <Leader>a: :Tabularize /:<CR>
		vmap <Leader>a: :Tabularize /:<CR>
		nmap <Leader>a:: :Tabularize /:\zs<CR>
		vmap <Leader>a:: :Tabularize /:\zs<CR>
		nmap <Leader>a, :Tabularize /,<CR>
		vmap <Leader>a, :Tabularize /,<CR>
		nmap <Leader>a,, :Tabularize /,\zs<CR>      
		vmap <Leader>a,, :Tabularize /,\zs<CR>
		nmap <Leader>a<Bar> :Tabularize /<Bar><CR>
		vmap <Leader>a<Bar> :Tabularize /<Bar><CR>
        like(more details see doc):
            :Tabularize /,    Alphabetical alignment
                Some short phrase         , some other phrase
                A much longer phrase here , and another long phrase
            :Tabularize /,/r1c1l0
                        Some short phrase , some other phrase
                A much longer phrase here , and another long phrase
      
    Bundle 'scrooloose/nerdcommenter':
        \cc 注释当前行和选中行  
        \cn 没有发现和\cc有区别  
        \c<空格> 如果被选区域有部分被注释，则对被选区域执行取消注释操作，其它情况执行反转注释操作  
        \cm 对被选区域用一对注释符进行注释，前面的注释对每一行都会添加注释  
        \ci 执行反转注释操作，选中区域注释部分取消注释，非注释部分添加注释  
        \cs 添加性感的注释，代码开头介绍部分通常使用该注释  
        \cy 添加注释，并复制被添加注释的部分  
        \c$ 注释当前光标到改行结尾的内容  
        \cA 跳转到该行结尾添加注释，并进入编辑模式  
        \ca 转换注释的方式，比如： /**/和//  
        \cl \cb 左对齐和左右对其，左右对其主要针对/**/  
        \cu 取消注释  
        The '\' in '\cc' is <Leader> key,     and the defaut <Leader>  is \

        gc{motion}              Comment or uncomment lines that {motion} moves over.
        gcc                     Comment or uncomment [count] lines.
        {Visual}gc              Comment or uncomment the highlighted lines.
        gc                      Text object for a comment (operator pending mode only.)
        gcgc                    Uncomment the current and adjacent commented lines.
        gcu		

    ctrlpvim/ctrlp.vim [file search <defaut key-map is ctrl+p>]
        Run :CtrlP or :CtrlP [starting-directory] to invoke CtrlP in find file mode.
        Run :CtrlPBuffer or :CtrlPMRU to invoke CtrlP in find buffer or find MRU file mode.
        Run :CtrlPMixed to search in Files, Buffers and MRU files at the same time.
        Check :help ctrlp-commands and :help ctrlp-extensions for other commands.

        Once CtrlP is open:

        Press <F5> to purge the cache for the current directory to get new files,
            remove deleted files and apply new ignore options.
        Press <c-f> and <c-b> to cycle between modes.
        Press <c-d> to switch to filename only search instead of full path.
        Press <c-r> to switch to regexp mode.
        Use <c-j>, <c-k> or the arrow keys to navigate the result list.
        Use <c-t> or <c-v>, <c-x> to open the selected entry in a new tab or in a new split.
        Use <c-n>, <c-p> to select the next/previous string in the prompt's history.
        Use <c-y> to create a new file and its parent directories.
        Use <c-z> to mark/unmark multiple files and <c-o> to open them.

        ctrl + j/k 进行上下选择
        ctrl + x 在当前窗口水平分屏打开文件
        ctrl + v 同上, 垂直分屏
        ctrl + t 在tab中打开
        <leader>-f模糊搜索最近打开的文件(MRU)
        <leader>-p模糊搜索当前目录及其子目录下的所有文件

	tacahiroy/ctrlp-funky.vim
		<leader>fu 进入当前文件的函数列表搜索
		<leader>fU 搜索当前光标下单词对应的函数
        Ctrl+j/k    : used for select functions

	tpope/vim-fugitive:
		nnoremap <silent> <leader>gs :Gstatus<CR>
		nnoremap <silent> <leader>gd :Gdiff<CR>
		nnoremap <silent> <leader>gc :Gcommit<CR>
		nnoremap <silent> <leader>gb :Gblame<CR>
		nnoremap <silent> <leader>gl :Glog<CR>
		nnoremap <silent> <leader>gp :Git push<CR>
		nnoremap <silent> <leader>gr :Gread<CR>
		nnoremap <silent> <leader>gw :Gwrite<CR>
		nnoremap <silent> <leader>ge :Gedit<CR>
		" Mnemonic _i_nteractive
		nnoremap <silent> <leader>gi :Git add -p %<CR>
		nnoremap <silent> <leader>gg :SignifyToggle<CR>
}


" Snippets & AutoComplete {
    YouCompleteMe :
        Valloric/YouCompleteMe:
            *:YcmRestartServer* :
                If the ycmd completion server [43] suddenly stops for some reason, you can restart it with this command.
            *:YcmForceCompileAndDiagnostics* :
                Calling this command will force YCM to immediately recompile your file and display any new diagnostics it encounters.
                Do note that recompilation with this  command may take a while and during this time the Vim GUI _will_ be blocked.
            *:YcmDiags* :
                Calling this command will fill Vim's 'locationlist' with errors or warnings if
                any were detected in your file and then open it. If a given error or warning
                can be fixed by a call to ':YcmCompleter FixIt', then '(FixIt available)' is
                appended to the error or warning text. See the |FixIt| completer subcommand for
                more information.
            *:YcmShowDetailedDiagnostic* :
                This command shows the full diagnostic text when the user's cursor is on the
                line with the diagnostic.
            *:YcmDebugInfo* :
                This will print out various debug information for the current file. Useful to
                see what compile commands will be used for the file if you're using the
                semantic completion engine.
            *:YcmToggleLogs* :
                This command opens in separate windows the logfiles given as arguments or
                closes them if they are already open in the editor. When no argument is given,
                list the available logfiles. Only for debugging purpose.
            *:YcmCompleter* :
                This command gives access to a number of additional IDE-like features in YCM,
                for things like semantic GoTo, type information, FixIt and refactoring.

            nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>
            nnoremap <F6> :YcmForceCompileAndDiagnostics<CR>  "force recomile with
            GoTo Commands ~
                These commands are useful for jumping around and exploring code. When moving
                the cursor, the subcommands add entries to Vim's 'jumplist' so you can use
                'CTRL-O' to jump back to where you where before invoking the command (and
                'CTRL-I' to jump forward; see ':h jumplist' for details). If there is more than
                one destination, the quickfix list (see ':h quickfix') is populated with the
                available locations and opened to full width at the bottom of the screen. You
                can change this behavior by using the |YcmQuickFixOpened| autocommand.
" }


HTML "{
    mattn/emmet-vim:
        *** Very Good plugin ***
        Chinese Doc : http://www.zfanw.com/blog/zencoding-vim-tutorial-chinese.html
        1. Expand an Abbreviation
          Type the abbreviation as 'div>p#foo$*3>a' and type '<c-y>,'.
          ---------------------
          <div>
              <p id="foo1">
                  <a href=""></a>
              </p>
              <p id="foo2">
                  <a href=""></a>
              </p>
              <p id="foo3">
                  <a href=""></a>
              </p>
          </div>
          ---------------------
        2. Wrap with an Abbreviation
          Write as below.
          ---------------------
          test1
          test2
          test3
          ---------------------
          Then do visual select(line wise) and type '<c-y>,'.
          Once you get to the 'Tag:' prompt, type 'ul>li*'.
          ---------------------
          <ul>
              <li>test1</li>
              <li>test2</li>
              <li>test3</li>
          </ul>
          ---------------------

          If you type a tag, such as 'blockquote', then you'll see the following:
          ---------------------
          <blockquote>
              test1
              test2
              test3
          </blockquote>
          ---------------------
        3. Balance a Tag Inward
          type '<c-y>d' in insert mode.
        4. Balance a Tag Outward
          type '<c-y>D' in insert mode.
        5. Go to the Next Edit Point
          type '<c-y>n' in insert mode.
        6. Go to the Previous Edit Point

          type '<c-y>N' in insert mode.

        7. Update an <img>’s Size

          Move cursor to the img tag.
          ---------------------
          <img src="foo.png" />
          ---------------------
          Type '<c-y>i' on img tag
          ---------------------
          <img src="foo.png" width="32" height="48" />
          ---------------------
        8. Merge Lines
          select the lines, which include '<li>'
          ---------------------
          <ul>
          	<li class="list1"></li>
          	<li class="list2"></li>
          	<li class="list3"></li>
          </ul>
          ---------------------
          and then type '<c-y>m'
          ---------------------
          <ul>
          	<li class="list1"></li><li class="list2"></li><li class="list3"></li>
          </ul>
          ---------------------
        9. Remove a Tag
          Move cursor in block
          ---------------------
          <div class="foo">
          	<a>cursor is here</a>
          </div>
          ---------------------
          Type '<c-y>k' in insert mode.
          ---------------------
          <div class="foo">

          </div>
          ---------------------
          And type '<c-y>k' in there again.
          ---------------------

          ---------------------
        10. Split/Join Tag
          Move the cursor inside block
          ---------------------
          <div class="foo">
          	cursor is here
          </div>
          ---------------------
          Type '<c-y>j' in insert mode.
          ---------------------
          <div class="foo"/>
          ---------------------
          And then type '<c-y>j' in there again.
          ---------------------
          <div class="foo">
          </div>
          ---------------------
        11. Toggle Comment
          Move cursor inside the block
          ---------------------
          <div>
          	hello world
          </div>
          ---------------------
          Type '<c-y>/' in insert mode.
          ---------------------
          <!-- <div>
          	hello world
          </div> -->
          ---------------------
          Type '<c-y>/' in there again.
          ---------------------
          <div>
          	hello world
          </div>
          ---------------------
        12. Make an anchor from a URL
          Move cursor to URL
          ---------------------
          http://www.google.com/
          ---------------------
          Type '<c-y>a'
          ---------------------
          <a href="http://www.google.com/">Google</a>
          ---------------------
        13. Make some quoted text from a URL
          Move cursor to the URL
          ---------------------
          http://github.com/
          ---------------------
          Type '<c-y>A'
          ---------------------
          <blockquote class="quote">
          	<a href="http://github.com/">Secure source code hosting and collaborative development - GitHub</a><br />
          	<p>How does it work? Get up and running in seconds by forking a project, pushing an existing repository...</p>
          	<cite>http://github.com/</cite>
          </blockquote>
          ---------------------
        14. Enable emmet.vim for the language you using.

          You can customize the behavior of the languages you are using.

          ---------------------
          # cat >> ~/.vimrc
          let g:user_emmet_settings = {
          \  'php' : {
          \    'extends' : 'html',
          \    'filters' : 'c',
          \  },
          \  'xml' : {
          \    'extends' : 'html',
          \  },
          \  'haml' : {
          \    'extends' : 'html',
          \  },
          \}
          ---------------------
" }

PHP "{
	PIV:
		 hit K (shift+k) on any function to see full documentation file for that function even offline.
		 #### Non-static completion
			$instance = new SomeClass; 
			... 
			$instance-><C-X><C-O> to display the omnicompletion menu (see :help ins-completion) 
			$instance->completeMe(); // will autoselect completeMe since it's the only public non-static method 
" }

























