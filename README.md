<h1 align="center">
    打造自己的 Vim
</h1>

## 目录

* [插件管理](#插件管理)
* [基础配置](#基础配置)
* [界面美化](#界面美化)
* [文件加持](#文件加持)
* [工程加持](#工程加持)
* [重型武器](#重型武器)

### 插件管理 <a name="插件管理">
------

* [Vundle](https://github.com/VundleVim/Vundle.vim)

1. 安装
```
" Vundle会将配置中的插件下载到该目录，如果没有请自行创建
cd ~/.vim/bundle 
git clone https://github.com/VundleVim/Vundle.vim.git
```

2. 配置
```
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'majutsushi/tagbar'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'dyng/ctrlsf.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'scrooloose/nerdcommenter'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
```

3. 使用
```
" 安装插件
:PluginInstall
" 清除插件
:PluginClean
" 升级插件
:PluginUpdate
```

*很多时候因网络状况的限制，下载YouCompleteMe需要相当长的时间，通常我使用git将仓库克隆到其对应的路径，但也必须将插件名称添加到插件列表中，否则插件不会被Vundle检测到并加载*

### 基础配置 <a name="基础配置">
------

*待完善*

### 界面美化 <a name="界面美化">
------

#### 颜色主题

1. [molokai](https://github.com/tomasr/molokai)
```
" 设置主题
colorscheme molokai
" 底部导航栏主题
let g:airline_theme='molokai'
```

2. [dracula](https://github.com/dracula/vim)
```
" 设置主题
colorscheme dracula
" 底部导航栏主题
let g:airline_theme='dracula'
```

3. [solarized](https://github.com/altercation/vim-colors-solarized)
```
" 设置主题
colorscheme solarized
set background=light
" 底部导航栏主题
let g:airline_theme='solarized'
let g:airline_solarized_bg='light'
```

#### 底部导航栏

* [vim-airline](https://github.com/vim-airline/vim-airline)
* [vim-airline-themes](https://github.com/vim-airline/vim-airline-themes)

#### 语法高亮

* [vim-cpp-enhanced-highlight](https://github.com/octol/vim-cpp-enhanced-highlight)

#### 代码缩进

* [vim-indent-guides](https://github.com/nathanaelkane/vim-indent-guides)
```
" 随 vim 自启动
let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
```

### 文件加持 <a name="文件加持">
------

#### 标识符列表

* [tagbar](https://github.com/majutsushi/tagbar)

**需要用到ctags，具体细节见后文**
1. 官方推荐了两个，Exuberant Ctags安装成功后即可使用，Universal Ctags不知什么原因不能使用，下来有空再看吧
2. 如果需要指定要使用的ctags，需要在配置中特意设置路径

```
" 设置 tagbar 子窗口的位置出现在主编辑区的右边 
let tagbar_right=1 
" 设置 ctags 所在目录，这里每个人均有不同
let g:tagbar_ctags_bin='/usr/local/bin/ctags'
" 设置显示／隐藏标签列表子窗口的快捷键 tb
nnoremap tb :TagbarToggle<CR> 
" 设置标签子窗口的宽度 
let tagbar_width=32 
" tagbar 子窗口中不显示冗余帮助信息 
let g:tagbar_compact=1
" 设置 ctags 对哪些代码标识符生成标签
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }
```

#### 快速注释

* [nerdcommenter](https://github.com/scrooloose/nerdcommenter)

```
" 添加注释
nmap <Leader>cc :NERDComComment
" 取消注释
nmap <Leader>cu :NERDComUnCommentLine
```

#### 模板补全

* [ultisnips](https://github.com/SirVer/ultisnips)

需要代码模板插件[vim-snippets](https://github.com/honza/vim-snippets)的配合
```
Plugin 'honza/vim-snippets'
" UltiSnips 的 tab 键与 YCM 冲突，重新设定
let g:UltiSnipsExpandTrigger="<leader><tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<leader><s-tab>"
```

#### 多光标编辑

* [vim-multiple-cursors](https://github.com/terryma/vim-multiple-cursors)

```
" 怎么全选？
" Default mapping
" let g:multi_cursor_start_word_key='<C-n>'
" let g:multi_cursor_select_all_word_key='<A-n>'
" let g:multi_cursor_start_key='g<C-n>'
" let g:multi_cursor_select_all_key='g<A-n>'
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
```

### 工程加持 <a name="工程加持">
------

#### 文件夹管理

* [nerdtree](https://github.com/scrooloose/nerdtree)

```
" 使用 NERDTree 插件查看工程文件。设置快捷键 nt
nmap nt :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=32
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=1
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1
" 只剩NERDTree窗口时退出
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
```

#### 声明/实现跳转

* [vim-fswitch](https://github.com/derekwyatt/vim-fswitch)

```
" 使用 ;sw 进行切换
nmap <silent> <Leader>sw :FSHere<cr>
```

*.cc 和 .h 间切换有问题，从cc切换时变成了.hh文件，应该是配置项中不识别.cc文件，下来关注这个问题*

#### 多文档编辑

* [minibufexpl.vim](https://github.com/fholgado/minibufexpl.vim)

```
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>
```

#### 内容查找

* [ctrlsf.vim](https://github.com/dyng/ctrlsf.vim)

**需要先安装ack**

```
" 怎么将窗口放到左侧第二个？ 怎么搜索后直接跳到新buffer中？
" 各配置项有什么区别？
" 使用CtrlSF进行搜索
nmap <Leader>sf :CtrlSF<CR>
```

### 重型武器 <a name="重型武器">
------

#### Ctags

* [indexer](https://github.com/vim-scripts/indexer.tar.gz)
依赖[DfrankUtil](https://github.com/vim-scripts/DfrankUtil), [vimprj](https://github.com/vim-scripts/vimprj)

```
" 设置插件 indexer 调用 ctags 的参数
" 默认 --c++-kinds=+p+l，重新设置为 --c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v
" 默认 --fields=+iaS 不满足 YCM 要求，需改为
" --fields=+iaSl，即增加了language选项
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"
" 关闭ctags警告
let g:indexer_disableCtagsWarning=1
```

~/.indexer_files
```
[foo] 
/data/workplace/foo/src/
[bar] 
/data/workplace/bar/src/
```

#### YouCompleteMe

*待完善*

### 参考 && 感谢
------

[yangyangwithgnu/use_vim_as_ide](https://github.com/yangyangwithgnu/use_vim_as_ide#4.7.2)

[Alexey Shmalko's Personal Blog](http://www.alexeyshmalko.com/2014/youcompleteme-ultimate-autocomplete-plugin-for-vim/)

