"|  \/  (_) |                        (_)
"| .  . |_| | _____  ___   _ ____   ___ _ __ ___  _ __ ___
"| |\/| | | |/ / _ \/ __| | '_ \ \ / / | '_ ` _ \| '__/ __|
"| |  | | |   <  __/\__ \ | | | \ V /| | | | | | | | | (__
"\_|  |_/_|_|\_\___||___/ |_| |_|\_/ |_|_| |_| |_|_|  \___|
"
"
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" If vundle is not installed, do it first
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
   let bundleExists = 1
  if (!isdirectory(expand("$HOME/.nvim/bundle/neobundle.vim")))
     call system(expand("mkdir -p $HOME/.nvim/bundle"))
     call system(expand("git clone https://github.com/Shougo/neobundle.vim ~/.nvim/bundle/neobundle.vim"))
     let bundleExists = 0
  endif


  if 0 | endif

  if has('vim_starting')
    if &compatible
      " Be iMproved
      set nocompatible
    endif

" Required:
    set runtimepath+=~/.nvim/bundle/neobundle.vim/
  endif

" Required:
  call neobundle#begin(expand('~/.nvim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
  NeoBundleFetch 'Shougo/neobundle.vim'

" syntax
  NeoBundle 'pangloss/vim-javascript'
  "NeoBundle 'isRuslan/vim-es6'
  "NeoBundle 'othree/yajs.vim'
  NeoBundle 'mxw/vim-jsx'
  NeoBundle 'tpope/vim-markdown'
  NeoBundle 'scrooloose/syntastic'
  NeoBundle '1995eaton/vim-better-javascript-completion'
  NeoBundle 'elzr/vim-json'
" Typescript
  NeoBundle 'leafgarland/typescript-vim'
  NeoBundle 'Shougo/vimproc.vim', {
       \ 'build' : {
       \     'windows' : 'tools\\update-dll-mingw',
       \     'cygwin' : 'make -f make_cygwin.mak',
       \     'mac' : 'make -f make_mac.mak',
       \     'linux' : 'make',
       \     'unix' : 'gmake',
       \    },
       \ }

" colorscheme & syntax highlighting
  NeoBundle 'mhartington/base16-vim'
  NeoBundle 'Yggdroot/indentLine'
  NeoBundle 'Raimondi/delimitMate'
  NeoBundle 'valloric/MatchTagAlways'
 " Git helpers
  NeoBundle 'tpope/vim-fugitive'
  NeoBundle 'airblade/vim-gitgutter'
  NeoBundle 'Xuyuanp/nerdtree-git-plugin'

" untils
  NeoBundle 'editorconfig/editorconfig-vim'
  NeoBundle 'scrooloose/nerdtree'
  NeoBundle 'ctrlpvim/ctrlp.vim'
  NeoBundle 'christoomey/vim-tmux-navigator'
  NeoBundle 'edkolev/promptline.vim'
  NeoBundle 'bling/vim-airline'
  NeoBundle 'tpope/vim-surround'
  NeoBundle 'tomtom/tcomment_vim'
  NeoBundle 'mattn/emmet-vim'
  NeoBundle 'Chiel92/vim-autoformat'
  NeoBundle 'ap/vim-css-color'
  " NeoBundle 'Shougo/deoplete.nvim'
 NeoBundle 'Valloric/YouCompleteMe', {
      \ 'build' : {
      \     'mac' : './install.sh --clang-completer --system-libclang',
      \     'unix' : './install.sh --clang-completer --system-libclang',
      \     'windows' : './install.sh --clang-completer --system-libclang',
      \     'cygwin' : './install.sh --clang-completer --system-libclang'
      \    }
      \ }
  NeoBundle 'Quramy/tsuquyomi'
  NeoBundle 'SirVer/ultisnips'
  NeoBundle 'honza/vim-snippets'
  NeoBundle 'matthewsimo/angular-vim-snippets'
  NeoBundle 'marijnh/tern_for_vim', {
        \ 'build' : {
        \     'mac' : 'npm install',
        \    }
        \ }
  NeoBundle 'rking/ag.vim'
  NeoBundle 'wincent/terminus'
  NeoBundle 'pelodelfuego/vim-swoop'
  " because fuck it, Icons are awesome
  NeoBundle 'ryanoasis/vim-devicons'


  call neobundle#end()

" Required:
  filetype plugin indent on
  NeoBundleCheck
  if bundleExists == 0
    echo "Installing Bundles, ignore errors"
  endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim untils
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let mapleader = ','
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  " set lazyredraw
  set syntax=whitespace
  set noswapfile
  set showcmd
  set backspace=indent,eol,start
  filetype on
  set number
  set tabstop=2
  set shiftwidth=2
  set expandtab
  set conceallevel=0
" tmux mouse support
  let g:vim_json_syntax_conceal = 0

" enable mouse
  set mouse=a

" Theme
  syntax enable
  " set t_Co=256
  let base16colorspace=256
  colorscheme base16-oceanicnext
  set background=dark
  map <Leader>b :let &background = ( &background == "dark"? "light" : "dark" )<CR>
  set pastetoggle=<leader>p
" Copy to osx clipboard
  vnoremap <C-c> "*y<CR>
  highlight MatchTag ctermfg=black ctermbg=lightgreen guifg=black guibg=lightgreen
  highlight clear SignColumn

" Git gitgutter column colors
  call gitgutter#highlight#define_highlights()

" This is the best
  nnoremap ; :
  let g:ycm_path_to_python_interpreter = '/usr/local/bin/python'
  let g:indent_guides_auto_colors = 0
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=3
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=4
  set wildmenu
  set laststatus=2
" if dir doesn't exsist, make it
  " function s:MkNonExDir(file, buf)
  "   if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
  "       let dir=fnamemodify(a:file, ':h')
  "       if !isdirectory(dir)
  "           call mkdir(dir, 'p')
  "       endif
  "   endif
  " endfunction
  " augroup BWCCreateDir
  "   autocmd!
  "   autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
  " augroup END
  set colorcolumn=100
  set wrap linebreak nolist
  set virtualedit=
  set display+=lastline

" Navigate between display lines
  noremap  <silent> <Up>   gk
  noremap  <silent> <Down> gj
  noremap  <silent> k gk
  noremap  <silent> j gj
  noremap  <silent> <Home> g<Home>
  noremap  <silent> <End>  g<End>
  inoremap <silent> <Home> <C-o>g<Home>
  inoremap <silent> <End>  <C-o>g<End>
" no need to fold things in markdown all the time
  let g:vim_markdown_folding_disabled = 1
  autocmd BufRead,BufNewFile *.md setlocal spell complete+=kspell

  let g:deoplete#enable_at_startup = 1
  map <leader>v :source ~/.dotfiles/nvimrc<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  map <C-\> :NERDTreeToggle<CR>
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  let NERDTreeShowHidden=1

" NERDTress File highlighting
  function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
  exec 'autocmd FileType nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
  exec 'autocmd FileType nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
  endfunction

  call NERDTreeHighlightFile('jade', 'green', 'none', 'green', 'none')
  call NERDTreeHighlightFile('ini', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('md', 'blue', 'none', '#6699CC', 'none')
  call NERDTreeHighlightFile('yml', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('config', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('conf', 'yellow', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('json', 'green', 'none', '#d8a235', 'none')
  call NERDTreeHighlightFile('html', 'yellow', 'none', '#d8a235', 'none')
  " call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', 'none')
  " call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', 'none')
  call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', 'none')
  call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', 'none')
  call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', 'none')
  call NERDTreeHighlightFile('ds_store', 'Gray', 'none', '#686868', 'none')
  call NERDTreeHighlightFile('gitconfig', 'black', 'none', '#686868', 'none')
  call NERDTreeHighlightFile('gitignore', 'Gray', 'none', '#7F7F7F', 'none')
  call NERDTreeHighlightFile('bashrc', 'Gray', 'none', '#686868', 'none')
  call NERDTreeHighlightFile('bashprofile', 'Gray', 'none', '#686868', 'none')

  let g:webdevicons_enable_ctrlp = 0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Snipppets
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable snipMate compatibility feature.
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<c-b>"
  let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Make files look nice
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" autocmd FileType css,scss,sass :ColorHighlight
  noremap <c-f> :Autoformat<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Typescript & Javscript omni complete
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:vimjs#casesensistive = 1
" Enabled by default. flip the value to make completion matches case insensitive

  let g:vimjs#smartcomplete = 0
" Disabled by default. Enabling this will let vim complete matches at any location
" e.g. typing 'ocument' will suggest 'document' if enabled.
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType typescript setlocal omnifunc=tsuquyomi#complete
  autocmd FileType typescript inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

  " let g:typescript_compiler_options = '-sourcemap'
  let g:typescript_indent_disable = 1
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#omni_patterns = {}
  let g:deoplete#omni_patterns.typescript = '\h\w*\|[^. \t]\.\w*'

"\h\w*\|[^. \t]\.\w*"
  autocmd FileType typescript setlocal completeopt-=preview
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet customization
" Enable Emmet in all modes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:user_emmet_mode='a'
" Remapping <C-y>, just doesn't cut it.
  function! s:expand_html_tab()
" try to determine if we're within quotes or tags.
" if so, assume we're in an emmet fill area.
   let line = getline('.')
   if col('.') < len(line)
     let line = matchstr(line, '[">][^<"]*\%'.col('.').'c[^>"]*[<"]')
     if len(line) >= 2
        return "\<C-n>"
     endif
   endif
" expand anything emmet thinks is expandable.
  if emmet#isExpandable()
    return "\<C-y>,"
  endif
" return a regular tab character
   return "\<tab>"
   endfunction
   autocmd FileType html imap <buffer><expr><tab> <sid>expand_html_tab()

   let g:use_emmet_complete_tag = 1
   let g:user_emmet_install_global = 0
   autocmd FileType html,css,ejs EmmetInstall
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRLP & GREP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"--nocolor"
  let g:ctrlp_user_command = 'ag %s -i --nogroup --hidden
    \ --ignore .git
    \ --ignore .svn
    \ --ignore .hg
    \ --ignore .DS_Store
    \ --ignore "**/*.pyc"
    \ --ignore lib
    \ -g ""'
  let g:ctrlp_regexp = 1
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 0
  let g:ctrlp_switch_buffer = 0
  " let g:ctrlp_match_func = {'match' : 'matcher#cmatch' }
  let g:ackprg = 'ag --nogroup --column'
  set grepprg=ag\ --nogroup\ --nocolor
  nnoremap <leader>a :Ag<space>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigate between vim buffers and tmux panels
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:tmux_navigator_no_mappings = 1
  nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
  nnoremap <silent> <C-h> :TmuxNavigateLeft<CR>
  nnoremap <silent> <C-;> :TmuxNavigatePrevious<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamemod = ':t'
  let g:airline#extensions#tabline#show_tab_nr = 1
  let g:airline_powerline_fonts = 1
  let g:airline_theme='base16'
" make sure to escape the spaces in the name properly
  set guifont=Sauce\ Code\ Powerline\ Plus\ Nerd\ File\ Types\ Mono:h11
" Tabline part of vim-airline
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
  nmap <leader>x :bp <BAR> bd #<CR>
" This replaes :tabnew which I used to bind to this mapping
  nmap <leader>n :enew<cr>
" Move to the next buffer
  nmap <leader>, :bnext<CR>
" Move to the previous buffer
  nmap <leader>. :bprevious<CR>
  let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  set statusline+=%#warningmsg#
  set statusline+=%{SyntasticStatuslineFlag()}
  set statusline+=%*
  let g:syntastic_javascript_checkers = ['jscs', 'eslint']
  let g:syntastic_check_on_open = 0
  " let g:syntastic_always_populate_loc_list = 1
  " let g:syntastic_auto_loc_list = 1

  let g:syntastic_aggregate_errors = 1
  let g:syntastic_error_symbol = '✗'
  let g:syntastic_warning_symbol = '!'
  let g:syntastic_style_error_symbol = '✗'
  let g:syntastic_style_warning_symbol = '!'

  noremap <leader>t :SyntasticToggleMode<CR>

  function! JscsFix()
      let l:winview = winsaveview()
      % ! jscs -x
      call winrestview(l:winview)
  endfunction
  command JscsFix :call JscsFix()

  noremap <leader>f :JscsFix<CR>
" autocmd BufWritePre *.js,*.jsx JscsFix

  let g:syntastic_mode_map = { 'passive_filetypes': ['sass', 'scss','html'] }
  map <Leader>e :lnext<CR>
  map <Leader>E :lprev<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" promptline config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  let g:promptline_theme = 'airline'
  let g:promptline_preset = {
  \'a' : [ promptline#slices#cwd()  ],
  \'b' : [ promptline#slices#vcs_branch()  ],
  \'c' : [promptline#slices#git_status()]}
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Source the vimrc file after saving it
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 if has("autocmd")
   autocmd bufwritepost .nvimrc source $MYVIMRC
 endif
