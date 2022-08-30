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
            ['<Tab>'] = cmp.mapping(function(fallback)
              if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                else
                  cmp.confirm()
                end
              else
                fallback()
              end
            end, { 'i', 's', 'c' })
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
    'williamboman/nvim-lsp-installer',
    'hrsh7th/cmp-nvim-lsp',
    {
      'neovim/nvim-lspconfig',
      config = function()
        require('nvim-lsp-installer').setup({
          automatic_installation = true
        })

        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

        lspconfig.tsserver.setup({
          capabilities = capabilities
        })
        lspconfig.sumneko_lua.setup({
          capabilities = capabilities
        })
        lspconfig.eslint.setup({
          capabilities = capabilities
        })
      end
    },
    cond = check_not_vscode
  }
  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
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
  use {
    'glepnir/lspsaga.nvim',
    branch = 'main',
    config = function()
      require('lspsaga').init_lsp_saga()

      vim.keymap.set('n', 'gh', function() require('lspsaga.provider').lsp_finder() end)
      vim.keymap.set('n', 'ca', function() require('lspsaga.codeaction').code_action() end)
      vim.keymap.set('v', 'ca', ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>')
      vim.keymap.set('n', 'K', function() require('lspsaga.hover').render_hover_doc() end)
      vim.keymap.set('n', '<C-f>', function() require('lspsaga.action').smart_scroll_with_saga(1) end)
      vim.keymap.set('n', '<C-b>', function() require('lspsaga.action').smart_scroll_with_saga(-1) end)
      vim.keymap.set('n', 'gs', function() require('lspsaga.signaturehelp').signature_help() end)
      vim.keymap.set('n', 'gr', function() require('lspsaga.rename').rename() end)
      vim.keymap.set('n', 'gd', function() require('lspsaga.provider').preview_definition() end)
      vim.keymap.set('n', '<leader>cd', function() require('lspsaga.diagnostic').show_line_diagnostics() end)
      vim.keymap.set('n', '<leader>cc', function() require('lspsaga.diagnostic').show_cursor_diagnostics() end)
      vim.keymap.set('n', '[e', function() require('lspsaga.diagnostic').lsp_jump_diagnostic_prev() end)
      vim.keymap.set('n', ']e', function() require('lspsaga.diagnostic').lsp_jump_diagnostic_next() end)
      vim.keymap.set('n', '<A-d>', function() require('lspsaga.floaterm').open_float_terminal() end)
      vim.keymap.set('t', '<A-d>', '<C-\\><C-n>:lua require("lspsaga.floaterm").close_float_terminal()<CR>')
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
      vim.g.catppuccin_flavour = 'frappe'
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
  use {
    'akinsho/bufferline.nvim',
    tag = 'v2.*',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      vim.opt.termguicolors = true

      require('bufferline').setup({
        options = {
          offsets = {
            {
              filetype = 'NvimTree',
              text = 'File Explorer',
              highlight = 'Directory',
              text_align = 'left'
            }
          }
        }
      })
    end,
    cond = check_not_vscode
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup()

      vim.keymap.set('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>')
      vim.keymap.set('n', '<leader>r', '<Cmd>NvimTreeRefresh<CR>')
      vim.keymap.set('n', '<leader>n', '<Cmd>NvimTreeFindFile<CR>')
    end,
    cond = check_not_vscode
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = 'nvim-lua/plenary.nvim',
    config = function()
      vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end)
      vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end)
      vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end)
      vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end)
    end,
    cond = check_not_vscode
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
