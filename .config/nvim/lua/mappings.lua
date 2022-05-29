vim.g.surround_no_mappings = 1
vim.api.nvim_set_keymap('n', 'ds', [[<Plug>Dsurround]], {})
vim.api.nvim_set_keymap('n', 'cs', [[<Plug>Csurround]], {})
vim.api.nvim_set_keymap('n', 'cS', [[<Plug>CSurround]], {})
vim.api.nvim_set_keymap('n', 'ys', [[<Plug>Ysurround]], {})
vim.api.nvim_set_keymap('n', 'yS', [[<Plug>YSurround]], {})
vim.api.nvim_set_keymap('n', 'yss', [[<Plug>Yssurround]], {})
vim.api.nvim_set_keymap('n', 'ySs', [[<Plug>YSsurround]], {})
vim.api.nvim_set_keymap('n', 'ySS', [[<Plug>YSsurround]], {})
vim.api.nvim_set_keymap('x', 'gs', [[<Plug>VSurround]], {})
vim.api.nvim_set_keymap('x', 'gS', [[<Plug>VgSurround]], {})

if vim.g.vscode then
  vim.api.nvim_set_keymap('n', 'z=', [[<Cmd>call VSCodeNotify('keyboard-quickfix.openQuickFix')<CR>]], { noremap = true })

  vim.api.nvim_set_keymap('x', 'gc', [[<Plug>VSCodeCommentary]], {})
  vim.api.nvim_set_keymap('n', 'gc', [[<Plug>VSCodeCommentary]], {})
  vim.api.nvim_set_keymap('o', 'gc', [[<Plug>VSCodeCommentary]], {})
  vim.api.nvim_set_keymap('n', 'gcc', [[<Plug>VSCodeCommentaryLine]], {})

  vim.api.nvim_set_keymap('n', '<C-j>', [[<Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>]], { noremap = true })
  vim.api.nvim_set_keymap('x', '<C-j>', [[<Cmd>call VSCodeNotify('workbench.action.navigateDown')<CR>]], { noremap = true })
  vim.api.nvim_set_keymap('n', '<C-k>', [[<Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>]], { noremap = true })
  vim.api.nvim_set_keymap('x', '<C-k>', [[<Cmd>call VSCodeNotify('workbench.action.navigateUp')<CR>]], { noremap = true })
  vim.api.nvim_set_keymap('n', '<C-h>', [[<Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>]], { noremap = true })
  vim.api.nvim_set_keymap('x', '<C-h>', [[<Cmd>call VSCodeNotify('workbench.action.navigateLeft')<CR>]], { noremap = true })
  vim.api.nvim_set_keymap('n', '<C-l>', [[<Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>]], { noremap = true })
  vim.api.nvim_set_keymap('x', '<C-l>', [[<Cmd>call VSCodeNotify('workbench.action.navigateRight')<CR>]], { noremap = true })

  vim.api.nvim_set_keymap('n', 'gr', [[<Cmd>call VSCodeNotify('editor.action.goToReferences')<CR>]], { noremap = true })

  vim.api.nvim_set_keymap('n', '<Space>', [[<Cmd>call VSCodeNotify('whichkey.show')<CR>]], { noremap = true })
  vim.api.nvim_set_keymap('x', '<Space>', [[<Cmd>call VSCodeNotifyVisual('whichkey.show', 1)<CR>]], { noremap = true })

  vim.api.nvim_set_keymap('n', '<Tab>', 'gt', {})
  vim.api.nvim_set_keymap('n', '<S-Tab>', 'gT', {})
end
