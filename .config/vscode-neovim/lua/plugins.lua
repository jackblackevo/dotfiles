local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  {
    "mg979/vim-visual-multi",
    branch = 'master'
  },
  {
    "tpope/vim-surround",
    config = function()
      vim.keymap.set('n', 'ds', '<Plug>Dsurround')
      vim.keymap.set('n', 'cs', '<Plug>Csurround')
      vim.keymap.set('n', 'cS', '<Plug>CSurround')
      vim.keymap.set('n', 'ys', '<Plug>Ysurround')
      vim.keymap.set('n', 'yS', '<Plug>YSurround')
      vim.keymap.set('n', 'yss', '<Plug>Yssurround')
      vim.keymap.set('n', 'ySs', '<Plug>YSsurround')
      vim.keymap.set('n', 'ySS', '<Plug>YSsurround')
      vim.keymap.set('x', 'gs', '<Plug>VSurround')
      vim.keymap.set('x', 'gS', '<Plug>VgSurround')
    end,
    init = function()
      vim.g.surround_no_mappings = 1
    end
  },
  {
    "ggandor/lightspeed.nvim",
    config = function()
      vim.api.nvim_set_hl(0, 'LightspeedCursor', { reverse = true })
    end
  }
})
