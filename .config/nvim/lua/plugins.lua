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
  use {
    'ggandor/lightspeed.nvim',
    config = function()
      if vim.g.vscode then
        vim.api.nvim_set_hl(0, 'LightspeedCursor', { reverse = true })
      end
    end
  }
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
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-vsnip',
    'hrsh7th/vim-vsnip',
    'onsails/lspkind.nvim',
    {
      'hrsh7th/nvim-cmp',
      config = function()
        local cmp = require('cmp')

        vim.opt.completeopt = 'menu,menuone,noselect'
        cmp.setup({
          snippet = {
            expand = function(args)
              vim.fn['vsnip#anonymous'](args.body)
            end
          },
          mapping = cmp.mapping.preset.insert({
            ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            ['<C-f>'] = cmp.mapping.scroll_docs(4),
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }),
          }),
          sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'vsnip' }
          }, {
            { name = 'buffer' }
          }),
          formatting = {
            format = require('lspkind').cmp_format()
          }
        })

        cmp.setup.cmdline('/', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = {
            { name = 'buffer' }
          }
        })

        cmp.setup.cmdline(':', {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = 'path' }
          }, {
            { name = 'cmdline' }
          })
        })
      end
    },
    'hrsh7th/cmp-nvim-lsp',
    {
      'neovim/nvim-lspconfig',
      config = function()
        local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

        require('lspconfig').tsserver.setup({
          capabilities = capabilities
        })
      end
    },
    cond = check_not_vscode
  }
  use {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup()
    end,
    cond = check_not_vscode
  }
  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup()
    end,
    cond = check_not_vscode
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'lua', 'json', 'html', 'css', 'javascript', 'typescript', 'tsx' },
        highlight = { enable = true }
      })
    end,
    cond = check_not_vscode
  }
  use {
    'catppuccin/nvim',
    as = 'catppuccin',
    config = function()
      require('catppuccin').setup()
      vim.g.catppuccin_flavour = 'dusk'
      vim.cmd[[colorscheme catppuccin]]
    end,
    cond = check_not_vscode
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('indent_blankline').setup({
        show_current_context = true,
        show_current_context_start = true
      })
    end,
    cond = check_not_vscode
  }
  use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup({ '*' }, { css = true })
    end,
    cond = check_not_vscode
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
