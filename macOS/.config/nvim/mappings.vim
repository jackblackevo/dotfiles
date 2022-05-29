map <Leader> <Plug>(easymotion-prefix)

" https://github.com/vscode-neovim/vscode-neovim#conditional-initvim
if exists('g:vscode')
  " https://github.com/vscode-neovim/vscode-neovim#keyboard-quickfix
  nnoremap z= <Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>

  " https://github.com/vscode-neovim/vscode-neovim#vim-commentary
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine

  " https://github.com/LunarVim/LunarVim/blob/freeze/utils/lv-vscode/init.vim
  " Better Navigation
  nnoremap <C-j> <Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>
  xnoremap <C-j> <Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>
  nnoremap <C-k> <Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>
  xnoremap <C-k> <Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>
  nnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>
  xnoremap <C-h> <Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>
  nnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>
  xnoremap <C-l> <Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>

  nnoremap gr <Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>

  nnoremap <Space> <Cmd>call VSCodeNotify('whichkey.show')<CR>
  xnoremap <Space> <Cmd>call VSCodeNotifyVisual('whichkey.show', 1)<CR>

  " Simulate same TAB behavior in VSCode
  nmap <Tab> gt
  nmap <S-Tab> gT
endif
