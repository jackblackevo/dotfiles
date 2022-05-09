set clipboard=unnamedplus
set number
set relativenumber

" Fix - VSCode-Neovim: Error detected while processing command line: E344
" https://github.com/vscode-neovim/vscode-neovim#conditional-initvim
if !exists('g:vscode')
  " https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation-of-missing-plugins
  " Install vim-plug if not found
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  endif
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" https://github.com/junegunn/vim-plug/wiki/tips#conditional-activation
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin()
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary', Cond(!exists('g:vscode'))
call plug#end()

" https://github.com/vscode-neovim/vscode-neovim#conditional-initvim
if exists('g:vscode')
  source ~/.config/nvim/vscode.vim
endif
