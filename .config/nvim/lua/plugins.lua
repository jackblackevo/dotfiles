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
  use 'tpope/vim-surround'
  use {
    'tpope/vim-commentary',
    cond = check_not_vscode
  }
  use 'ggandor/lightspeed.nvim'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
