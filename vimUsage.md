*************************************************************
*	Descirption	:	本文件解释Vim插件的使用方法				*
*	Author		:	CHRIS									*
*	Date		:	20160805								*
*************************************************************
Default {
    vim buffer:
        :ls         查看
        1 #  "shell1.sh"
        2 %a "shell2.sh"
        3    "shell.sh"
        :bn/bnext bp      切换后一个/前一个缓冲区
        :bdelete N1,N2,N3 删除缓冲区
        :N,M bdelete
        :buffer{bufname}
        :buffer N         直接凭编号跳转到一个缓冲区
        :bd 关闭当前buffer，对应文件也随之关闭
        %符号指明哪个缓冲区在当前窗口中可见，而#符号则代表轮换文件。
        用Ctrl + ^在当前文件和轮换文件间快速切换。
}


Deps {
	ag.vim	[搜索插件]
		vim		: Ag [options] {pattern} [{directory}]
		Command : ag [options] {pattern} [{directory}]
		
		1.在当前目录递归搜索单词”eat”,不匹配类似于”feature”或”eating”的字符串:				$ Ag -w eat
		2.搜索有特殊字符的字符串’$path=.’,所有的元字符（比如’$',’.')需要在字面上被匹配:		$ Ag -Q '$path=.' /etc
		3.除了dowloads目录，在所有目录搜索”about”单词:										$ Ag about --ignore-dir=downloads
		4.只搜索包含’protected’单词的PHP文件，然后通过文件名把搜索结果整合在一起，打印每个文件对应的搜索结果:	$ Ag --php --group protected
		5.获取包含’CFLAG’关键字的Makefile的文件名。文件名为*.mk,makefile,Makefile,GNUmakefile的都在考虑范围内:	$ Ag --make -l CFLAG
		6.显示整个日志文件时高亮匹配到的字符串:												$ tail -f /var/log/syslog | Ag --passthru 192.168.1.10
		7.要换取Ag支持的文件过滤类型，运行：												$ Ag --help-type	
		In the quickfix window, you can use:
		e    to open file and close the quickfix window
		o    to open (same as enter)
		go   to preview file (open but maintain focus on ag.vim results)
		t    to open in new tab
		T    to open in new tab silently
		h    to open in horizontal split
		H    to open in horizontal split silently
		v    to open in vertical split
		gv   to open in vertical split silently
		q    to close the quickfix window
		As ：http://blog.bccn.net/%E9%9D%99%E5%A4%9C%E6%80%9D/13430
		
	Tagbar	: 实现函数的跳转
		生成tags：
			c: ctags –R src
			c++： ctags -R --c++-kinds=+p --fields=+iaS --extra=+q src
			--c++-kinds=+p : 为C++文件增加函数原型的标签
			--fields=+iaS : 在标签文件中加入继承信息(i)、类成员的访问控制信息(a)、以及函数的指纹(S)
			--extra=+q : 为标签增加类修饰符。注意，如果没有此选项，将不能对类成员补全
			-R : 递归生成src中所有源文件的tags文件
		命令:
			CTRL+]	：	就会跳转到对应的定义
			CTRL+o 	：	可以回退到原来的地方
						如果当前光标下是个局部变量， gd 跳到这个局部变量的定义处
						
	Cscope{
		cscope -Rbq	:	项目的根目录运行<cscope.out cscope.in.out cscope.po.out>
						其中cscope.out是基本的符号索引，后两个文件是使用”-q“选项生成的，可以加快cscope的索引速度
		cd 项目目录
			find *.php -type f > cscope.files
			该命令把所有普通文件都加入了cscope.files
			cscope会解析该目录下的每一个文件。
			上面的cscope命令并没有使用”-R“参数递归查找子目录，因为在cscope.files中已经包含了子目录中的文件
			
			下表中列出了cscope的常用选项：
			-R: 在生成索引文件时，搜索子目录树中的代码
			-b: 只生成索引文件，不进入cscope的界面
			-q: 生成cscope.in.out和cscope.po.out文件，加快cscope的索引速度
			-k: 在生成索引文件时，不搜索/usr/include目录
			-i: 如果保存文件列表的文件名不是cscope.files时，需要加此选项告诉cscope到哪儿去找源文件列表。可以使用”-“，表示由标准输入获得文件列表。
			-Idir: 在-I选项指出的目录中查找头文件
			-u: 扫描所有文件，重新生成交叉索引文件
			-C: 在搜索时忽略大小写
			-Ppath: 在以相对路径表示的文件前加上的path，这样，你不用切换到你数据库文件所在的目录也可以使用它了。
			在vim中使用cscope非常简单，首先调用”cscope add“命令添加一个cscope数据库，然后就可以调用”cscope find“命令进行查找了。vim支持8种cscope的查询功能，如下：

			cs find c|d|e|f|g|i|s|t name
			0 或 s	查找本 C 符号(可以跳过注释)
			1 或 g	查找本定义
			2 或 d	查找本函数调用的函数
			3 或 c	查找调用本函数的函数
			4 或 t	查找本字符串
			6 或 e	查找本 egrep 模式
			7 或 f	查找本文件
			8 或 i	查找包含本文件的文件	
			
			为了方便使用，编写了下面的脚本来更新cscope和ctags的索引文件：
			#!/bin/sh  find . -name "*.h" -o -name "*.c"-o -name "*.cc" > cscope.files cscope -bkq -i cscope.files ctags -R 
			这个脚本，首先使用find命令，查找当前目录及子目录中所有后缀名为”.h”, “.c”和”.cc”的文件，并把查找结果重定向到文件cscope.files中。
			然后cscope根据cscope.files中的所有文件，生成符号索引文件。
			最后一条命令使用ctags命令，生成一个tags文件，在vim中执行”:help tags”命令查询它的用法。它可以和cscope一起使用。			
	}
}

General {
	nerdtree[目录树]
		Usage:
			F3	:	切换目录树		
			o       在已有窗口中打开文件、目录或书签，并跳到该窗口
			go      在已有窗口 中打开文件、目录或书签，但不跳到该窗口
			t       在新 Tab 中打开选中文件/书签，并跳到新 Tab
			T       在新 Tab 中打开选中文件/书签，但不跳到新 Tab
			i       split 一个新窗口打开选中文件，并跳到该窗口
			gi      split 一个新窗口打开选中文件，但不跳到该窗口
			s       vsplit 一个新窗口打开选中文件，并跳到该窗口
			gs      vsplit 一个新 窗口打开选中文件，但不跳到该窗口
			!       执行当前文件
			O       递归打开选中 结点下的所有目录
			x       合拢选中结点的父目录
			X       递归 合拢选中结点下的所有目录
			e       Edit the current dif
			中键    对文件相当于 NERDTree-i，对目录相当于 NERDTree-e
			D       删除当前书签
			P       跳到根结点
			p       跳到父结点
			K       跳到当前目录下同级的第一个结点
			J       跳到当前目录下同级的最后一个结点
			k       跳到当前目录下同级的前一个结点
			j       跳到当前目录下同级的后一个结点

			C       将选中目录或选中文件的父目录设为根结点
			u       将当前根结点的父目录设为根目录，并变成合拢原根结点
			U       将当前根结点的父目录设为根目录，但保持展开原根结点
			r       递归刷新选中目录
			R       递归刷新根结点
			m       显示文件系统菜单 #！！！然后根据提示进行文件的操作如新建，重命名等
			cd      将 CWD 设为选中目录

			I       切换是否显示隐藏文件
			f       切换是否使用文件过滤器
			F       切换是否显示文件
			B       切换是否显示书签

			q       关闭 NerdTree 窗口
			?       切换是否显示 Quick Help
			:tabnew [++opt选项] ［＋cmd］ 文件      建立对指定文件新的tab
			:tabc   关闭当前的 tab
			:tabo   关闭所有其他的 tab
			:tabs   查看所有打开的 tab
			:tabp   前一个 tab
			:tabn   后一个 tab

			标准模式下：
			gT      前一个 tab
			gt      后一个 tab
			Use these variables in your vimrc. Note that below are default arrow symbols
			let g:NERDTreeDirArrowExpandable = '?'
			let g:NERDTreeDirArrowCollapsible = '?'
	vim-nerdtree-tabs[目录树]
		Usage:
			使nerdtree新打开的共享目录树插件]
			
	surround [改变字符串]
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
			
	ctrlpvim/ctrlp.vim [文件搜索]
		Usage:
			ctrl + j/k 进行上下选择
			ctrl + x 在当前窗口水平分屏打开文件
			ctrl + v 同上, 垂直分屏
			ctrl + t 在tab中打开
			<leader>-f模糊搜索最近打开的文件(MRU)
			<leader>-p模糊搜索当前目录及其子目录下的所有文件		
	tacahiroy/ctrlp-funky.vim
		Usage:
		<leader>fu 进入当前文件的函数列表搜索
		<leader>fU 搜索当前光标下单词对应的函数	
		
	vim-multiple-cursors [多光标Vim 可同时操作]
		Usage:
			Ctrl + n 来多重选取
			按下c进行修改
			键入修改
			
			按下V选中整行
			按下G到达末行
			按下 <C-n> 在每行的开头加上一个光标并返回普通模式
			按下I在每行的头部插入
			键入”, 按下 <C-e> 到达行末, 键入另一个”和逗号
			然后将每个光标都下移一行，按下delete
			
			在普通模式下，按下 Ctrl-n 开始进入可视模式并选中光标下的单词，继续按 Ctrl-n 选择下一个相同的单词，按下 Ctrl-p 往回选一个， Ctrl-x 则跳过下一个相同单词。
			选中后就可以对单词进行批量改动了，比如按下c，就同时修改选中单词。				
			
	gcmt/wildfire.vim
		Usage:
			回车		：选中当前区域中
			[数字]回车	：选中几层区域			
			
}

General Programming{
	scrooloose/syntastic
		Pick one of the checksyntax, jslint, or syntastic
		按需安装相关的语法检查工具
		以javascript为例。在安装完syntastic之后，我选择使用jshint来作为js的语法检查工具。
		
	vim-fugitive
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
	
	tabular
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
}
	
HTML {
	amirh/HTML-AutoCloseTag：
	自动关闭Html 标签  输入> 
}

Common {
	%	跳转到配对的括号去
	[[	跳转到代码块的开头去(但要求代码块中'{'必须单独占一行)
	gD	跳转到局部变量的定义处
	''	跳转到光标上次停靠的地方, 是两个', 而不是一个"
	mx	设置书签,x只能是a-z的26个字母
	`x	跳转到书签处("`"是1左边的键)
	>	增加缩进,"x>"表示增加以下x行的缩进
	<	减少缩进,"x<"表示减少以下x行的缩进
}

YouCompleteMe {
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
}





























