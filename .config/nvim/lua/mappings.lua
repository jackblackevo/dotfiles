if vim.g.vscode then
  vim.keymap.set('n', 'z=', '<Cmd>call VSCodeNotify("keyboard-quickfix.openQuickFix")<CR>')

  vim.keymap.set({ 'x', 'n', 'o' }, 'gc', '<Plug>VSCodeCommentary')
  vim.keymap.set('n', 'gcc', '<Plug>VSCodeCommentaryLine')

  vim.keymap.set({ 'n', 'x' }, '<C-j>', '<Cmd>call VSCodeNotify("workbench.action.navigateDown")<CR>')
  vim.keymap.set({ 'n', 'x' }, '<C-k>', '<Cmd>call VSCodeNotify("workbench.action.navigateUp")<CR>')
  vim.keymap.set({ 'n', 'x' }, '<C-h>', '<Cmd>call VSCodeNotify("workbench.action.navigateLeft")<CR>')
  vim.keymap.set({ 'n', 'x' }, '<C-l>', '<Cmd>call VSCodeNotify("workbench.action.navigateRight")<CR>')

  vim.keymap.set('n', 'gr', '<Cmd>call VSCodeNotify("editor.action.goToReferences")<CR>')

  vim.keymap.set('n', '<Space>', '<Cmd>call VSCodeNotify("whichkey.show")<CR>')
  vim.keymap.set('x', '<Space>', '<Cmd>call VSCodeNotifyVisual("whichkey.show", 1)<CR>')

  vim.keymap.set('n', '<S-l>', 'gt', { remap = true })
  vim.keymap.set('n', '<S-h>', 'gT', { remap = true })
end
