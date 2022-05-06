set clipboard=unnamedplus
set number
set relativenumber

" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation-of-missing-plugins
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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

" https://github.com/LunarVim/LunarVim/blob/freeze/utils/lv-vscode/init.vim
function! s:vscodeCommentary(...) abort
  if !a:0
    let &operatorfunc = matchstr(expand('<sfile>'), '[^. ]*$')
    return 'g@'
  elseif a:0 > 1
    let [line1, line2] = [a:1, a:2]
  else
    let [line1, line2] = [line("'["), line("']")]
  endif

  call VSCodeCallRange("editor.action.commentLine", line1, line2, 0)
endfunction

function! s:openVSCodeCommandsInVisualMode()
  normal! gv
  let visualmode = visualmode()
  if visualmode == "V"
    let startLine = line("v")
    let endLine = line(".")
    call VSCodeNotifyRange("workbench.action.showCommands", startLine, endLine, 1)
  else
    let startPos = getpos("v")
    let endPos = getpos(".")
    call VSCodeNotifyRangePos("workbench.action.showCommands", startPos[1], endPos[1], startPos[2], endPos[2], 1)
  endif
endfunction

function! s:openWhichKeyInVisualMode()
  normal! gv
  let visualmode = visualmode()
  if visualmode == "V"
    let startLine = line("v")
    let endLine = line(".")
    call VSCodeNotifyRange("whichkey.show", startLine, endLine, 1)
  else
    let startPos = getpos("v")
    let endPos = getpos(".")
    call VSCodeNotifyRangePos("whichkey.show", startPos[1], endPos[1], startPos[2], endPos[2], 1)
  endif
endfunction

" https://github.com/vscode-neovim/vscode-neovim#conditional-initvim
if exists('g:vscode')
  " VSCode extension
  " https://github.com/vscode-neovim/vscode-neovim#keyboard-quickfix
  nnoremap z= <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>

  " https://github.com/vscode-neovim/vscode-neovim#vim-commentary
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine

  " https://github.com/LunarVim/LunarVim/blob/freeze/utils/lv-vscode/init.vim
  " Better Navigation
  nnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
  xnoremap <silent> <C-j> :call VSCodeNotify('workbench.action.navigateDown')<CR>
  nnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
  xnoremap <silent> <C-k> :call VSCodeNotify('workbench.action.navigateUp')<CR>
  nnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
  xnoremap <silent> <C-h> :call VSCodeNotify('workbench.action.navigateLeft')<CR>
  nnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>
  xnoremap <silent> <C-l> :call VSCodeNotify('workbench.action.navigateRight')<CR>

  nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>

  " Bind C-/ to vscode commentary since calling from vscode produces double comments due to multiple cursors
  xnoremap <expr> <C-/> <SID>vscodeCommentary()
  nnoremap <expr> <C-/> <SID>vscodeCommentary() . '_'

  nnoremap <silent> <C-w>_ :<C-u>call VSCodeNotify('workbench.action.toggleEditorWidths')<CR>

  nnoremap <silent> <Space> :call VSCodeNotify('whichkey.show')<CR>
  xnoremap <silent> <Space> :<C-u>call <SID>openWhichKeyInVisualMode()<CR>

  xnoremap <silent> <C-P> :<C-u>call <SID>openVSCodeCommandsInVisualMode()<CR>

  " Simulate same TAB behavior in VSCode
  nmap <Tab> :Tabnext<CR>
  nmap <S-Tab> :Tabprev<CR>
else
  " ordinary neovim
endif
