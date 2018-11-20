# VIM配置的安装流程

### 1. 安装流程

+ 字体安装  
powerline/fonts :  
    " fonst used for powerline/airline..  
    cd ~/.vim/bundle/fonts/  
    ./install  
    
+ YouComplete编译安装  
Valloric/YouCompleteMe :  
    " Vim 7.4.143  Python 2/3support.  
    cd ~/.vim/vim_setting/script  
    sh YouCompleteMe.sh  
    Because this plugin in need install  
        modidy the configuration file [ already copy to vim_setting]  
        Maybe need add some headfiles to the configuration file if you want.  
    neocomplete : require vim-lua  

+ 常用工具  
ag.vim  
    sudo apt-get install silversearcher-ag  
tagbar.vim  
    sudo apt-get install ctags  
cscope:  
    sudo apt-get install cscope  
php-cs-fix  
    brew install php-cs-fixer  


### 2. 常见插件配置

    " General {
        vim-airline/vim-airline:
            let g:airline_left_sep = '»'
            let g:airline_right_sep = '«'
            More symbols is in airline.txt,  and can change symbols as you want.

            Note: If you define any section variables it will replace the default values
            entirely.  If you want to disable only certain parts of a section you can try
            using variables defined in the |airline-configuration| or |airline-extensions|
            section.
            >
              variable names                default contents
              ----------------------------------------------------------------------------
              let g:airline_section_a       (mode, crypt, paste, spell, iminsert)
              let g:airline_section_b       (hunks, branch)
              let g:airline_section_c       (bufferline or filename)
              let g:airline_section_gutter  (readonly, csv)
              let g:airline_section_x       (tagbar, filetype, virtualenv)
              let g:airline_section_y       (fileencoding, fileformat)
              let g:airline_section_z       (percentage, line number, column number)
              let g:airline_section_error   (ycm_error_count, syntastic, eclim)
              let g:airline_section_warning (ycm_warning_count, whitespace)

              " here is an example of how you could replace the branch indicator with
              " the current working directory, followed by the filename.
              let g:airline_section_b = '%{getcwd()}'
              let g:airline_section_c = '%t'
            <

        Xuyuanp/nerdtree-git-plugin:
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
            Use this variable to change symbols.

        nathanaelkane/vim-indent-guides:
            Indent Guides is a plugin for visually displaying indent levels in Vim.

        easymotion/vim-easymotion:
            EasyMotion provides a much simpler way to use some motions in vim.
            The default leader has been changed to <Leader><Leader> to avoid conflicts with other plugins you may have installed. T           his can easily be changed back to pre-1.3 behavior by rebinding the leader in your vimrc:
            map <Leader> <Plug>(easymotion-prefix)

    "}


    " General Programming {
        tpope/vim-surround : 
            Surround.vim is all about "surroundings": parentheses, brackets, quotes,
            XML tags, and more.  The plugin provides mappings to easily delete,
            change and add such surroundings in pairs.

        godlygeek/tabular:
            it's useful to line up text.

        mhinz/vim-signify:
            Indicate changed lines within a file using a VCS.        
                `+`     This line was added.
                `!`     This line was modified.
                `_1`    The number of deleted lines below this sign. If the number is larger
                `99`    than 9, the `_` will be omitted. For numbers larger than 99, `_>`
                `_>`    will be shown instead.
                `!1`    This line was modified and a number of lines below were deleted.
                `!>`    It is a combination of `!` and `_`. If the number is larger than 9,
                      `!>` will be shown instead.
                `‾`     The first line was removed. It's a special case of the `_` sign.
                See |g:signify_sign_add| on how to use different signs.

        tpope/vim-fugitive:
            Whenever you edit a file from a Git repository, a set of commands is defined that serve as a gateway to Git.

    " }


    " Snippets & AutoComplete {
        Valloric/YouCompleteMe:
            a code-completion engine for Vim
    " }


    " PHP {
        spf13/PIV:
            " PHP相关的特性 0/开打折叠 1/关闭折叠
                let g:DisableAutoPHPFolding = 0
                let g:PIVAutoClose = 0
            ### PHP Doc Gen
            Generate phpDocumentor conforming documentation blocks for your PHP code. 
            To use place cursor on line with class, function or variable definition and type ,pd (in n mode)
    " }

    " HTML {
        tpope/vim-haml:
            contains the runtime files for Haml, Sass, and SCSS that ship with Vim
            Haml:是一种用来描述任何XHTML web document的标记语言，它是干净，简单的。而且也不用内嵌代码。

        mattn/webapi-vim:
            Support some webapi plugins (TODO: when use it configure)
            *Basic HTTP/*OAuth/*Atompub/*SOAP (in progress)/*XMLRPC/*MetaWeblog API
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


