Description : This is my Vim Configuration

    Install : curl https://raw.githubusercontent.com/chrisImprove/vim/master/bootstrap.sh > bootstrap.sh && sh bootstrap.sh
    
    Introduction : Contains of YouCompleteMe, UI, General, PHP, C, Javascript, Html and so on.
    
    Files :
        bootstrap.sh :  This file for installation.
        .vimrc       :  The configuration of vim.
        .vimrc.bundles : All Plugin manage here, managed by vundle.
        .vimrc.bundles.conf : All Plugin configuration.
        vim.explain.md : Detailed explanation of installation method.
        vimUsage.md :   Tells how to use plugin(like ctags, ag, nerdtree...)



    Steps :
        1.  Install The Tagbar
            sudo apt install exuberant-ctags

        2.  Font Install
            cd  ~/.vim/bundle/fonts/ && sh install
       
        3.  Compile YouCompleteMe
            sh ~/.vim/vim_setting/script && sh YouCompleteMe.sh



    Issue :
        1.  vim-airline 这个版本比较美观
            commit 13bd4701ed8ef57150f2d4f56122cd11ecf39345

