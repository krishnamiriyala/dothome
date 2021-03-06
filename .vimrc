"---[ vimrc ]--------------------------------------------------------
" by: grant welch
"---[ notes ]--------------------------------------------------------
" q· record to some register, <number>@· to replay macro
" m· mark a location, `· return to the mark
" * search forward for word under cursor, # search backward
" >> indent current line
"---[ nocompatible ]-------------------------------------------------
  set nocompatible
"---[ vundle ]-------------------------------------------------------
" git clone https://github.com/VundleVim/Vundle.vim.git /etc/vim/bundle/Vundle.vim
  set rtp+=/etc/vim/bundle/Vundle.vim
"---[ plugins ]------------------------------------------------------
  call vundle#begin()
  " let Vundle manage Vundle, required
  Plugin 'gmarik/Vundle.vim'
  " Ruby plugin
  Plugin 'vim-ruby/vim-ruby'
  " add ⌘ r to run ruby code
  Plugin 'henrik/vim-ruby-runner'
  " Vim-Sensible sets some univerally accepted vim defaults
  Plugin 'tpope/vim-sensible'
  " Vim-Unimpaired adds square bracket mappings
  Plugin 'tpope/vim-unimpaired'
  " Vim-Surround provides easy shortcuts to change surrounding quotes, brackets, etc
  Plugin 'tpope/vim-surround'
  " Git syntax highlighting, indention, etc.
  Plugin 'tpope/vim-git'
  " Vim-Fugitive is a git wrapper, ex: :Git status; :Git branch
  Plugin 'tpope/vim-fugitive'
  " Vim-GitGutter shows git diff lines in the 'gutter' (left of line numbers)
  Plugin 'airblade/vim-gitgutter'
  " buffer explorer provides a menu to switch buffers
  Plugin 'jlanzarotta/bufexplorer'
  " NerdTree provides a file tree to navigate a directory structure
  Plugin 'scrooloose/nerdtree'
  " Ctrl+P opens files using fuzzy search
  Plugin 'kien/ctrlp.vim'
  " Tagbar provides easy navigational access to class, func, etc definitions
  Plugin 'majutsushi/tagbar'
  " Undotree provides better access to VIM undo structure
  Plugin 'mbbill/undotree'
  " Syntastic does syntax checking
  Plugin 'scrooloose/syntastic'
  " Requirements for snipmate, below
  Plugin 'marcweber/vim-addon-mw-utils'
  Plugin 'tomtom/tlib_vim'
  " Snipmate provides UltiSnips functionality
  Plugin 'garbas/vim-snipmate'
  " vim-snippets provides the actual snippets
  Plugin 'honza/vim-snippets'
  " Vim-Airline makes pretty status lines
  Plugin 'bling/vim-airline'
  " Tabular filter and align text
  Plugin 'godlygeek/tabular'
  " Molokai is a high-contrast, colorful colortheme
  Plugin 'tomasr/molokai'
  " Badwolf, ditto; the original sjl version lacks contrasting Diff colors
  " Plugin 'sjl/badwolf'
  Plugin 'alx741/badwolf'
  " Testing...
  Plugin 'kana/vim-textobj-user'
  Plugin 'bps/vim-textobj-python'
  Plugin 'Valloric/YouCompleteMe'
  call vundle#end()
"---[ options ]------------------------------------------------------
" vim-sensible handles backspace, incsearch
  set shortmess+=I    " removes intro message
  set virtualedit=onemore " cursor goes past last char
  set showcmd         " show command is it's typed
  set ruler           " show cursor position
  set number          " show line numbers
  set softtabstop=4   " a tab is four spaces
  set shiftwidth=4    " number of spaces to use for autoindenting
  set expandtab       " use spaces in place of tabs
  set smarttab        " insert tabs on the start of a line according to
                      "    shiftwidth, not tabstop
  set autoindent      " always set autoindenting on
  set copyindent      " copy the previous indentation on autoindenting
  set shiftround      " use multiple of shiftwidth when indenting with '<' and '>'
  set showmatch       " set show matching parenthesis
  set ignorecase      " ignore case when searching
  set smartcase       " ignore case if search pattern is all lowercase,
                      "    case-sensitive otherwise
  set hlsearch        " highlight search terms
  set title           " change the terminal's title
  set visualbell      " don't beep
  set noerrorbells    " don't beep
  set nobackup        " don't save a backup file
  set noswapfile      " don't creat a swap file
  set history=1000    " remember more commands and search history
  set undolevels=1000 " use many muchos levels of undo
  set timeoutlen=2000 " extend timeout length to 4 seconds
  set fileformat=unix " default to unix file format
  set nowrap          " don't wrap
  set nolist          " don't list special chars, set listchars
  set listchars=trail:·,tab:»·,extends:>,precedes:<,nbsp:+
  set linebreak       " use linebreak wrapping
  set scrolloff=10    " minimum number of rows before/after of cursor
  set sidescrolloff=10  " minimum number of cols left/right of cursor
  set textwidth=0     " prevent hard wrapping
  set wrapmargin=0    " prevent hard wrapping
  set colorcolumn=140  " add visual demarkation at 140 char
  set showbreak=↪     " change the wrap character
  set fo+=l           " do not break up lines in insert mode
  set fo+=r           " add comment leader in insert mode
  set fo+=j           " remove comment leader when joining lines
  set fdls=99         " start vim unfolded
  set foldmethod=indent   " fold based on indent level
  filetype plugin indent on
"---[ statusline ]----------------------------------------------------
  set laststatus=2            " always display status line
  set statusline=%F%m%r%h%w\  " display pathname and flags
  set statusline+=\|b=%n\|    " buffer number
  set statusline+=f=%{&ff}    " format (unix or windows)
  set statusline+=\|t=%Y      " filetype (for syntax hilighting)
  set statusline+=\|%L        " number of lines in file
  set statusline+=\|p=%l,%v\| " line and column position in file
  set statusline+=%=%p%%\     " right justify; place in file by percentage
  set statusline+=%{strftime(\"%m/%d/%y\ %H:%M\")}
"---[ buffers\windows ]-----------------------------------------------
  set hidden          " hide buffers
  set wmh=0           " hide windows completely
  set wmw=0           " hide windows completely
  set splitbelow      " split under the current window
  set splitright      " split right of the current window
  set noequalalways   " prevent vim from resizing windows
"---[ highlighting ]-------------------------------------------------
  set background=dark
  if &t_Co > 2 || has("gui_running")
    " switch syntax highlighting on, when the terminal has colors
    syntax on
  endif

  if &t_Co >= 256 || has("gui_running")
    colorscheme badwolf
    "highlight 80th column
    highlight ColorColumn ctermbg=196 guibg=#ff2c4b
    "highlight text that runs over 80 chars
    highlight OverLength ctermbg=196 guibg=#ff2c4b ctermfg=white
    match OverLength /\%81v.\+/
  endif
"---[ gui ]-----------------------------------------------------------
  if has("gui_running")
    set go+=a       " copy Visual selection to c-p buffer
    set go+=e       " use GUI tabline
    set go+=m       " add menu bar
    set go+=g       " grey inactive menu items
    set go+=t       " include tearoff menu items
    set go+=T       " include Toolbar
    set go+=r       " show vertical scrollbar
    set go+=b       " show bottom scrollbar

    set lines=40    " gvim default to 40 lines
    set columns=88  " gvim default to 88 columns
  else
  endif
"---[ navigation ]----------------------------------------------------
  " let j/k move through wrapped lines
  nnoremap j gj
  nnoremap k gk
"---[ mappings ]------------------------------------------------------
  " 'jk' to Esc and keep cursor at its current location
  inoremap jk <Esc>l
  " make Y consistent with D and C; yank rest of line, not the whole line
  nnoremap Y y$
  " no more help
  nnoremap <F1> <nop>
  " no Ex mode
  nnoremap Q <nop>
  " no more manpages
  nnoremap K <nop>
  " ZJ quits all windows
  nnoremap ZJ :qa<CR>
  " Change working directory to that of current file
  cabbrev cwd lcd %:p:h
  " Write no a write-protected file with root
  cabbrev w!! %!sudo tee > /dev/null %
  " space open/closes folds
  nnoremap <space> za
"---[ leader mappings ]-----------------------------------------------
  let mapleader=","   " change the mapleader from \ to ,
  " Quickly edit/source the vimrc file
  nnoremap <leader>ve :e $MYVIMRC<CR>
  nnoremap <leader>vs :so $MYVIMRC<CR>
  " clear search
  nnoremap <leader>/ :nohlsearch<CR>
  " clear signs
  " nnoremap <leader>lg :sign unplace *<CR>
  " let g:gitgutter_sign_column_always = 1
  nnoremap <leader>lg :GitGutterToggle<CR>
  " toggle line numbers
  nnoremap <leader>ln :set number!<CR>
  " toggle relative line numbers
  nnoremap <leader>lr :set relativenumber!<CR>
  " toggle linebreak
  nnoremap <leader>lb :set linebreak! linebreak?<CR>
  " toggle list characters
  nnoremap <leader>li :set list! list?<CR>
  " toggle line wrapping
  nnoremap <leader>lw :set wrap! wrap?<CR>
  " toggle syntax highlighting
  nnoremap <leader>sh  :call ToggleSyntax()<CR>
  " toggle spell checking
  nnoremap <leader>sp :set invspell<CR>
  " toggle pastemode
  set pastetoggle=<leader>.
  " windows
    nnoremap <leader>w <c-w>
"---[ functions ]-----------------------------------------------------
  "Toggle syntax highlighting on and off
  function! ToggleSyntax()
    if exists("g:syntax_on")
      syntax off
    else
      syntax enable
    endif
  endfunction
"---[ abbreviations ]-------------------------------------------------
  " Horizontal bars
  iabbrev Yr "---[ ]---------------------------------------------------------------
  iabbrev Y- "---------------------------------------------------------------------
  " Timestamps
  " date standard, date/time
  iabbrev Yds     <C-R>=strftime("%Y-%m-%d")<CR>
  iabbrev Ydts    <C-R>=strftime("%Y-%m-%d - %X")<CR>
  " long form date, date/time
  iabbrev Ydl     <C-R>=strftime("%b %d, %Y")<CR>
  iabbrev Ydtl    <C-R>=strftime("%b %d, %Y - %X")<CR>
"---[ Plugins ]-------------------------------------------------------
"---[ airline ]-------------------------------------------------------
  " Using Liberation Mono for Powerline, 13pt
  let g:airline_left_sep = ''
  let g:airline_right_sep = ''
  let g:airline_theme='badwolf'
  nnoremap <leader>a <Esc>:AirlineToggle<CR>
"---[ Buffer Explorer ]-----------------------------------------------
  " Show no name buffers
  let g:bufExplorerShowNoName=1
"---[ CtrlP ]---------------------------------------------------------
  let g:ctrlp_working_path_mode = 0
"---[ Nerdtree ]------------------------------------------------------
  let NERDTreeIgnore=['\.pyc$','\.vim$', '\~$']
  let NERDTreeShowHidden=1
  let NERDTreeMinimalUI=1
  nnoremap <leader>N <Esc>:NERDTreeToggle<CR>
"---[ Syntastic ]-----------------------------------------------------
  let g:syntastic_python_checkers = ['pylint', 'pep8']
  nnoremap <leader>sc <Esc>:SyntasticCheck<CR>
"---[ Tagbar ]--------------------------------------------------------
  if filereadable("/usr/local/Cellar/ctags/5.8/bin/ctags")
    let g:tagbar_ctags_bin = "/usr/local/Cellar/ctags/5.8/bin/ctags"
  endif
  nnoremap <leader>T <Esc>:TagbarToggle<CR>
"---[ Undotree ]------------------------------------------------------
  if has("persistent_undo")
    if !isdirectory($HOME . "/tmp/vim/undo")
      silent! call mkdir($HOME . "/tmp/vim/undo", "p")
    endif
    set undodir=~/tmp/vim/undo/
    set undofile
  endif
  nnoremap <leader>u <Esc>:UndotreeToggle<CR>
