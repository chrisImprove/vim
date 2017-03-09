*****************************************************************
*   Descirption :   本文件是详细说明Vim相关插件配置               *
*   Author      :   CHRIS                                       *
*   Date        :   20160805                                    *
*****************************************************************
Tips {
    在vimrc中删除了Q->q Wq-wq的映射等等
    Search Chris can find the position
}

Deps {
    /* 依赖于命令行插件 */
    ag.vim
        sudo apt-get install silversearcher-ag

    tagbar.vim
        " C语言家族的自动跳转YouCompleteMe已经支持了[Used For PHP]
        sudo apt-get install ctags
        Config:
            nnoremap <silent> <leader>tt :TagbarToggle<CR>
            nnoremap <silent> <F4>:TagbarToggle<CR>
            let g:tagbar_left = 1
    cscope:
        sudo apt-get install cscope
}

" UI{
    flazz/vim-colorschemes
        Used to change the schemes(defaut one is solarized)
        colorscheme nameofcolorscheme[wombat/molokai/solarized...]
        
    vim-airline
        Defaut Setting as follows:
        let g:airline_theme = 'solarized'
" }

" General {
    Nerd:
       map <F3> :NERDTreeTabsToggle<CR>
       
    Xuyuanp/nerdtree-git-plugin:
        在vimrc中定义如下变量可以修改默认显示
        let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"
            \ }
 
    nathanaelkane/vim-indent-guides:
        不同缩进等级之间显示竖线
        detect both tab and space indent styles.
        
    wildfire:
	    按Enter选中最近的代码块
	    Press `<ENTER>` in normal mode to select the closest text object
	    pressing `2<ENTER>` will select the second closest textd$
	    
    matchit.zip:
        可以使用% 在括号间跳转(也可以自定义跳跃的开头结尾 见.vimrc.bundles.conf)
        Extended matching with "%"   
   
    vim-scripts/sessionman.vim:
        nmap <leader>sl :SessionList<CR>
        nmap <leader>ss :SessionSave<CR>
        nmap <leader>sc :SessionClose<CR>
        可以恢复到上次保存session的环境
    
    vim-easymotion:
        多光标操作(默认为<Leader><Leader>  即 ,,)
        The default leader has been changed to <Leader><Leader> to avoid conflicts with other plugins you may have installed
        ,,f/F/s                     前/后/双向
        ,,E/gE(W/B) ,,e/ge(w/b)     <下 上> 句子(单词)的最后(前面)字符
        ,,j/k                     行级跳转
        <Leader><leader>.   重复上一次操作
        
    terryma/vim-multiple-cursors
        多光标操作 <C-n>开始/选中  <C-x>跳过   <C-p>前一个  按c一起修改
        let g:multi_cursor_next_key='<C-n>'
        let g:multi_cursor_prev_key='<C-p>'
        let g:multi_cursor_skip_key='<C-x>'
        let g:multi_cursor_quit_key='<Esc>'
        Insert mode such as `c` or `s` from Visual mode or `i`, `a`, `I`, `A` in Normal mode should work without any issues.             
        
     Bundle jiangmiao/auto-pairs:
        括号自动补齐 支持如下{} [] '' ""
        input: |[foo, bar()] (press (<M-e> at |)       -->      output: ([foo, bar()])
        Quick jump to closed pair.    (press } at |)
        input:                                                  output:
        {                                                       {
            something;|                                 -->         something; 
        }                                                       }|    
" }


" General Programming {
    'tpope/vim-surround':
        # 替换: cs"'
        "Hello world!" -> 'Hello world!'
        # 替换-标签(t=tag): cst"
        <a>abc</a>  -> "abc"
        cst<html>
        <a>abc</a>  -> <html>abc</html>
        # 删除: ds"
        "Hello world!" -> Hello world!
        # 添加(ys=you surround): ysiw"
        Hello -> "Hello"
        # 添加: csw"
        Hello -> "Hello"
        # 添加-整行: yss"
        Hello world -> "Hello world"
        # ySS"
        Hello world ->
        "
        hello world
        "
        # 添加-两个词: veeS"
        hello world -> "hello world"
        # 添加-当前到行尾: ys$"
        # 左符号/右符号 => 带不带空格
        cs([
        (hello) -> [ hello ]
        cs(]
        (hello) -> [hello]
        自定义快捷键(看配置文件)
        print "Hello *world!"     yss-        <?php print "Hello world!" ?>   
        自定义快捷键(看配置文件)
        print "Hello *world!"     yss-        <?php print "Hello world!" ?>
        
    'tpope/vim-repeat':
         重复一个插件的操作, 支持surround.vim, 通过 surround 操作之后的行为, .号重复
         
    Bundle 'godlygeek/tabular':
        格式化对齐工具
        :Tabularize /,    首字母对齐
            Some short phrase         , some other phrase
            A much longer phrase here , and another long phrase
        :Tabularize /,/r1c1l0
                    Some short phrase , some other phrase
            A much longer phrase here , and another long phrase
        更多的查看文档及.vimrc.bundles.conf
        
    Bundle 'tpope/vim-commentary':
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
        命令 \cc 中的 \ 为<Leader>符，<Leader>符默认为 \
        
    Bundle 'tpope/vim-commentary':
        这个插件可以快速注释与反注释多行内容
        gc{motion}              Comment or uncomment lines that {motion} moves over.
        gcc                     Comment or uncomment [count] lines.
        {Visual}gc              Comment or uncomment the highlighted lines.
        gc                      Text object for a comment (operator pending mode only.)
        gcgc                    Uncomment the current and adjacent commented lines.
        gcu
        
    Bundle 'ctrlpvim/ctrlp.vim'         默认快捷键是Ctrl+p
        使用:CtrlP或:CtrlP [starting-directory]调用CtrlP进入查找文件模式
        使用:CtrlPBuffer或:CtrlPMRU进入查找buffer或者查找MRU文件模式
        使用:CtrlPMixed同时搜索普通文件、Buffers或者MRU文件    
        一旦CtrlP被打开了，就可以使用以下的命令
        <F5> 清除当前目录下的缓存，获取新的结构
        <c-f>和<c-b> 在各个模式下转换
        <c-d> 使用文件名搜索代替全路径搜索
        <c-r> 使用正则模式
        <c-j>和<c-k> 上下选择文件
        <c-t> <c-v>和<c-x> 在新的tab或者新的分割窗口打开选择的文件
        <c-n>和<c-p> 找到之前或者之后查找的字符串
        <c-y> 创建一个新的文件
        <c-z> 标记或者取消标记多个文件然后使用<c-o>打开它们
               
    Bundle 'tacahiroy/ctrlp-funky' 
        nnoremap <Leader>fu :CtrlPFunky<Cr>    " fu 进入当前文件的函数列表搜索
        " fU 搜索当前光标下单词对应的函数
        nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr> 
        使用Ctrl+j/k  选择函数
" }
  
    
" Snippets & AutoComplete {
	youcompleteme	：Vim 7.4.143  Python 2/3support.
    neocomplete		：vim-lua [Higher than neocomplcache]
	neocomplcache	：无需插件
    Youcompleteme:
        Bundle 'SirVer/ultisnips'
            Install:
                1. Install development tools and CMake: 'sudo apt-get install build-essential cmake'
                2. Make sure you have Python headers installed: 'sudo apt-get install python-dev python3-dev'.
                3. 为了支持JavaScript环境install [Node.js and npm]
                    sudo apt-get install nodejs*      (node -v   The version should be higher than v0.10.32.)
                    sudo apt-get install npm        (npm -v    The version should be higher than 2.1.8.)
                4. Compiling && Install YCM
                    cd ~/.vim/bundle/YouCompleteMe
                    ./install.py --clang-completer --tern-completer (semantic support for C-family languages， --tern-completer:JavaScript)
                5.  修改配置文件[有升级再改  默认已经Copy一份到vim_setting]
                    cp ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py ~/.vim/vim_setting/
                    注释掉
                    try:
                        final_flags.remove( '-stdlib=libc++' )
                    except ValueError:
                        pass
                    添加头文件 -i系统头文件 -I第三方头文件
                    '-isystem',
                    '/usr/include'
                    '-isystem',
                    '/usr/include/c++/5'
                    '-isystem',
                    '/usr/include/python3.5'
        Bundle 'SirVer/ultisnips'          代码片段
        Bundle 'honza/vim-snippets'
            let g:UltiSnipsExpandTrigger = '<C-k>'
            let g:UltiSnipsJumpForwardTrigger = '<C-k>'
            let g:UltiSnipsJumpBackwardTrigger = '<C-kj>'
            
    neocomplete:
        照配置来   智能提示
        Bundle 'Shougo/neocomplete.vim.git'
        Bundle 'Shougo/neosnippet'
        The standard snippets repository for neosnippet
        Bundle 'Shougo/neosnippet-snippets'
        Bundle 'honza/vim-snippets'           
" }


" PHP {
    spf13/PIV:
        " PHP相关的特性 0/开打折叠 1/关闭折叠
            let g:DisableAutoPHPFolding = 0
            let g:PIVAutoClose = 0
        ### PHP Doc Gen
        Generate phpDocumentor conforming documentation blocks for your PHP code. 
        To use place cursor on line with class, function or variable definition and type ,pd (in n mode)
    vim-php-namespace:
    beyondwords/vim-twig:
        Twig是PHP的一个灵活、高效并且安全的PHP模板引擎
" }


" HTML {
    HTML-AutoCloseTag:
    hail2u/vim-css3-syntax:
    gorodinskiy/vim-coloresque:
    tpope/vim-haml:
        contains the runtime files for Haml, Sass, and SCSS that ship with Vim
        Haml:是一种用来描述任何XHTML web document的标记语言，它是干净，简单的。而且也不用内嵌代码。
    mattn/webapi-vim:
        支持一些 webapi插件  需要的时候在配置
        * Basic HTTP
        * OAuth
        * Atompub
        * SOAP (in progress)
        * XMLRPC
        * MetaWeblog API
    mattn/emmet-vim:
        神器  可以快捷的写多层结构
        中文文档http://www.zfanw.com/blog/zencoding-vim-tutorial-chinese.html
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


" javascript {                                                                                        
    elzr/vim-json:
        Json 相关的配置(插件，语法等等)
    groenewege/vim-less:
        Less 是一个 CSS 预处理器，让 CSS 具有动态性。
    pangloss/vim-javascript:
    briancollins/vim-jst:
        A vim plugin for highlighting and indenting JST/EJS syntax. Based on the eruby syntax from vim-ruby.
        Probably not 100% correct (especially indentation), but it works for most cases I've tried.
        This plugin may require the vim-javascript plugin
    kchmck/vim-coffee-script:
        CoffeeScript是一套JavaScript的转译语言
        
        
" }





















