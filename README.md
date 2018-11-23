**VIM 配置说明**
======

### **1. 安装方法:**
```
curl https://raw.githubusercontent.com/chrisImprove/vim/master/bootstrap.sh > bootstrap.sh && sh bootstrap.sh

cd ~/.vim/vim_setting/script && sh YouCompleteMe.sh

cd  ~/.vim/bundle/fonts/ && sh install

brew install the_silver_searcher

brew install exuberant-ctags

brew install php-cs-fixer

sudo npm -g install instant-markdown-d

brew install cscope
```
> php-cs-fixer : *PHP代码格式化*

> instant-markdown-d : *Markdown自动启动浏览器*

### **2. 文件说明:**
> bootstrap.sh :  引导文件

> .vimrc       :  Vim配置文件

> .vimrc.bundles : 插件管理文件(安装，卸载)

> .vimrc.bundles.conf : 插件配置文件

> explain : vim及插件的使用方法解释说明的存放目录

> script :  常用的一些脚本存放目录


### **3. 备注:**
> 1. vim-airline 这个版本比较美观 <br>
    commit 13bd4701ed8ef57150f2d4f56122cd11ecf39345

