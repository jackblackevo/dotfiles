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

local check_not_vscode = function()
  return not vim.g.vscode
end

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
    "numToStr/Comment.nvim",
    config = function()
      require('Comment').setup()
    end,
    cond = check_not_vscode
  },
  {
    "ggandor/lightspeed.nvim",
    config = function()
      if vim.g.vscode then
        vim.api.nvim_set_hl(0, 'LightspeedCursor', { reverse = true })
      end
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
    config = function()
      require('lualine').setup()
    end,
    cond = check_not_vscode
  },
  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require('gitsigns').setup()
    end,
    cond = check_not_vscode
  },
  {
    "folke/which-key.nvim",
    config = function()
      require('which-key').setup()
    end,
    cond = check_not_vscode
  },
  {
    "rcarriga/nvim-notify",
    cond = check_not_vscode
  },
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'onsails/lspkind.nvim',
    },
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
    end,
    cond = check_not_vscode
  },
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate", -- :MasonUpdate updates registry contents
    config = function()
      require('mason').setup()
    end,
    cond = check_not_vscode
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig"
    },
    config = function()
      require('mason-lspconfig').setup({
        automatic_installation = true
      })

      local lspconfig = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

      lspconfig.tsserver.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities
      })
      lspconfig.eslint.setup({
        capabilities = capabilities
      })
    end,
    cond = check_not_vscode
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require('fidget').setup()
    end,
    cond = check_not_vscode
  },
  {
    "ray-x/lsp_signature.nvim",
    config = function()
      require('lsp_signature').setup()
    end,
    cond = check_not_vscode
  },
  {
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require('lspsaga').setup({})

      vim.keymap.set('n', 'gh', function() require('lspsaga.provider').lsp_finder() end)
      vim.keymap.set('n', 'ca', function() require('lspsaga.codeaction').code_action() end)
      vim.keymap.set('v', 'ca', ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>')
      vim.keymap.set('n', 'K', function() require('lspsaga.hover').render_hover_doc() end)
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
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      --Please make sure you install markdown and markdown_inline parser
      { "nvim-treesitter/nvim-treesitter" }
    },
    cond = check_not_vscode
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require('nvim-autopairs').setup()
    end,
    cond = check_not_vscode
  },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require('nvim-treesitter.configs').setup({
        ensure_installed = { 'lua', 'json', 'html', 'css', 'javascript', 'typescript', 'tsx' },
        highlight = { enable = true }
      })
    end,
    cond = check_not_vscode
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require('catppuccin').setup()
      vim.g.catppuccin_flavour = 'frappe'
      vim.cmd [[colorscheme catppuccin]]
    end,
    cond = check_not_vscode
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require('indent_blankline').setup({
        show_current_context = true,
        show_current_context_start = true
      })
    end,
    cond = check_not_vscode
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup({ '*' }, { css = true })
    end,
    cond = check_not_vscode
  },
  {
    "akinsho/bufferline.nvim",
    version = "v3.*",
    dependencies = 'nvim-tree/nvim-web-devicons',
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
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      require('nvim-tree').setup()

      vim.keymap.set('n', '<leader>e', '<Cmd>NvimTreeToggle<CR>')
      vim.keymap.set('n', '<leader>r', '<Cmd>NvimTreeRefresh<CR>')
      vim.keymap.set('n', '<leader>n', '<Cmd>NvimTreeFindFile<CR>')
    end,
    cond = check_not_vscode
  },
  {
    "nvim-telescope/telescope.nvim",
    version = '0.1.1',
    dependencies = "nvim-lua/plenary.nvim",
    config = function()
      vim.keymap.set('n', '<leader>ff', function() require('telescope.builtin').find_files() end)
      vim.keymap.set('n', '<leader>fg', function() require('telescope.builtin').live_grep() end)
      vim.keymap.set('n', '<leader>fb', function() require('telescope.builtin').buffers() end)
      vim.keymap.set('n', '<leader>fh', function() require('telescope.builtin').help_tags() end)
    end,
    cond = check_not_vscode
  }
})
