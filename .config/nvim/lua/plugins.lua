local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

local check_not_vscode = function()
  return not vim.g.vscode
end

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use {
    'mg979/vim-visual-multi',
    branch = 'master'
  }
  use {
    'tpope/vim-surround',
    config = function()
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
    end,
    setup = function()
      vim.g.surround_no_mappings = 1
    end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
    cond = check_not_vscode
  }
  use 'ggandor/lightspeed.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup()
    end,
    cond = check_not_vscode
  }
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
    cond = check_not_vscode
  }
  use {
    'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end,
    cond = check_not_vscode
  }
  use {
    'rcarriga/nvim-notify',
    cond = check_not_vscode
  }
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').tsserver.setup({})
    end,
    cond = check_not_vscode
  }
  use {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup()
    end,
    cond = check_not_vscode
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
