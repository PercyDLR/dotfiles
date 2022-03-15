" ##############################################################################
" ############################# NEOVIM CONFIG ##################################
" ######################## CONFIGURACIÓN DE NEOVIM #############################
" ##############################################################################


set nocompatible                " Vi Compatibility - Compatibilidad con Vi
filetype on                     " File Detection - Deteccion del tipo de archivo

" ####################################################################
" ##### PLUGINS (Vim-Plug) => https://github.com/junegunn/vim-plug
" ####################################################################

call plug#begin('~/.config/nvim/plugged')

" ############################## BASICO #####################################
    Plug 'itchyny/lightline.vim'                       " Lightline statusbar
    Plug 'frazrepo/vim-rainbow'
" ################################### NERDTREE #####################################
    Plug 'scrooloose/nerdtree'                         " Nerdtree
    Plug 'tiagofumo/vim-nerdtree-syntax-highlight'     " Highlighting Nerdtree
    Plug 'ryanoasis/vim-devicons'                      " Icons for Nerdtree
" #################################### COLOR #######################################
    Plug 'tanvirtin/monokai.nvim'                      " Monokai theme
    Plug 'PotatoesMaster/i3-vim-syntax'                " i3 config highlighting
    Plug 'kovetskiy/sxhkd-vim'                         " sxhkd highlighting
    Plug 'vim-python/python-syntax'                    " Python highlighting
    Plug 'ap/vim-css-color'                            " Color previews for CSS
" #################################### EXTRAS ######################################
    Plug 'junegunn/limelight.vim'                      " Hyperfocus on a range
    Plug 'junegunn/vim-emoji'                          " Vim needs emojis!

call plug#end()

" Let a plugin to modify indent - Permite a un plugin modificar el indentado
filetype plugin indent on

" ############ VIM-PLUG COMMAND LIST - LISTA DE COMANDOS DE VIM-PLUG ##############
"       :PluginList       - Lists configured plugins - Lista los plugins configurados
"       :PluginInstall    - Installs plugins - Instla plugins
"       :PluginUpdate     - Update Plugins - Actualiza Plugins
"       :PluginSearch foo - Searches for foo - Busca a el plugin foo
"       :PluginClean      - Remove unused plugins - Elimina plugins no usuados

" ####################################################################
" ###### GENERAL
" ####################################################################

set path+=**                    " Searches current directory recursively.
set showcmd                     " Muestra info de la tecla leader
let mapleader = ' '             " Define tecla lider a <Espacio>
set cursorline                  " Resalta la línea actual
set wildmenu                    " Display all matches when tab complete.
set incsearch                   " Incremental search
set hidden                      " Needed to keep multiple buffers open
set nobackup                    " No auto backups
set noswapfile                  " No swap
set spelllang=en,es             " Corregir palabras usando diccionarios en inglés y español
nnoremap <C-s> :w<CR>
set t_Co=256                    " Set if term supports 256 colors.
set number                      " Display line numbers
set clipboard=unnamedplus       " Copy/paste between vim and other programs.
syntax enable
let g:rehash256 = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Remap Keys
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap ESC to ii
:imap ii <Esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global theme
colorscheme monokai_pro

" The lightline.vim theme
let g:lightline = {
     \ 'colorscheme': 'one',
     \ }

" Always show statusline
set laststatus=2

"lua << EOF
"    local statusline = require('statusline')
"    statusline.tabline = true
"EOF

" Uncomment to prevent non-normal modes showing in powerline and below powerline.
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab                   " Use spaces instead of tabs.
set smarttab                    " Be smart using tabs ;)
set shiftwidth=4                " One tab == four spaces.
set tabstop=4                   " One tab == four spaces.

"""""""""""""""i""""""""""""""""""""""""""""""""""""""""""""""""
" => NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Uncomment to autostart the NERDTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '►'
let g:NERDTreeDirArrowCollapsible = '▼'
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI = 1
let g:NERDTreeWinSize=38

" Stops creating a new tab when using enter on a directory 
"function! NERDTreeCustomOpenDir(node)
"	call a:node.activate()
"endfunction
"call NERDTreeAddKeyMap({'key': '<ENTER>', 'scope': 'DirNode', 'callback': 'NERDTreeCustomOpenDir', 'quickhelpText': 'open dir'})
let NERDTreeCustomOpenArgs={'file':{'where': 't'}}

" #############################################################
" ###### TERMINAL
" #############################################################
map tt :vnew term://zsh<CR>

" #############################################################
" ###### MOUSE
" #############################################################
set mouse=nicr
set mouse=a

" #############################################################
" ####### ALACRITTY FIX - RETOQUE PARA ALACRITTY
" #############################################################
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

" #############################################################
" ####### TABS - PESTAÑAS
" #############################################################

set splitbelow splitright

" Use <Alt> key - Usar tecla <Alt>
map <A-Left> :tabp<CR>
map <A-Right> :tabn<CR>
map <A-Up> :tabnew<Space>
map <A-Down> :tabclose<CR>

" Remap splits navigation to just CTRL + hjkl
nnoremap <Leader><Left> <C-w>h
nnoremap <Leader><Down> <C-w>j
nnoremap <Leader><Up> <C-w>k
nnoremap <Leader><Right> <C-w>l

" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>

" Change 2 split windows from vert to horiz or horiz to vert
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K

" Removes pipes | that act as seperators on splits
set fillchars+=vert:/

" #############################################################
" ####### LIMELIGHT PLUGIN
" #############################################################
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240

" Color name (:help gui-colors) or RGB color
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'

" Default 
" let g:limelight_default_coefficient = 0.5

" Number of preceding/following paragraphs to include (default: 0)
" let g:limelight_paragraph_span = 0

" Beginning/end of paragraph
"   When there's no empty line between the paragraphs
"   and each paragraph starts with indentation
" let g:limelight_bop = '^\s'
" let g:limelight_eop = '\ze\n^\s'

" Highlighting priority (default: 10)
"   Set it to -1 not to overrule hlsearch
"let g:limelight_priority = -1

" Toggle Plugin - Alternar Plugin (Ctrl+l)
let t:ll_on = 0

function! Toggle_Limelight()
    if t:ll_on == 0
        Limelight
        let t:ll_on = 1
    else
        Limelight!
        let t:ll_on = 0
    endif
endfunction
nnoremap <C-l> :call Toggle_Limelight()<CR>

" #############################################################
" ####### EXTRAS
" #############################################################
let g:python_highlight_all = 1

au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org            call org#SetOrgFileType()

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
" set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
"set guifont=SauceCodePro\ Nerd\ Font:h15
"set guifont=Mononoki\ Nerd\ Font:h15
set guifont=JetBrains\ Mono:h15

" Toggle Transparency - Alternar Transparencia (Ctrl+x)
hi Normal guibg=NONE ctermbg=NONE

let t:is_transparent = 0                     
function! Toggle_transparent_background()                      
    if t:is_transparent == 0                   
        hi Normal guibg=#111111 ctermbg=black                     
        let t:is_transparent = 1
    else
        hi Normal guibg=NONE ctermbg=NONE                    
        let t:is_transparent = 0                        
    endif                   
endfunction               
nnoremap <C-x> :call Toggle_transparent_background()<CR>
