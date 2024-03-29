--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]
-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true

-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua,*.js,*.jsx,*.ts,*tsx,*json",
  timeout = 1000,
}
vim.opt.undofile = false
vim.opt.relativenumber = true
vim.opt.list = true
vim.opt.listchars:append("tab:»·")
vim.opt.listchars:append("trail:·")
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false
vim.opt.spell = true

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
-- lvim.keys.normal_mode["<C-s>"] = ":w<cr>"

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
lvim.keys.normal_mode["<M-l>"] = ":BufferLineMoveNext<CR>"
lvim.keys.normal_mode["<M-h>"] = ":BufferLineMovePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}
lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}
lvim.builtin.which_key.mappings["D"] = {
  name = "Diffview",
  c = { "<cmd>DiffviewClose<cr>", "Close the current diffview" },
  e = { "<cmd>DiffviewToggleFiles<cr>", "Files panel" },
  h = { "<cmd>DiffviewFileHistory<cr>", "File History" },
  H = { "<cmd>DiffviewFileHistory %<cr>", "File History(for current file)" },
}
lvim.builtin.which_key.mappings["E"] = { "<cmd>NvimTreeFocus<cr>", "Switch Explorer" }

-- -- Change theme settings
-- lvim.colorscheme = "lunar"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.rainbow.enable = true

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/configuration/language-features/language-servers>

vim.list_extend(lvim.lsp.installer.setup.automatic_installation.exclude, { "tsserver" })

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- https://github.com/williamboman/mason.nvim/blob/c43eeb5614a09dc17c03a7fb49de2e05de203924/doc/mason.txt#L467
if require("mason-registry").is_installed("stylelint_lsp") then
  require("lvim.lsp.manager").setup("stylelint_lsp", {
    settings = {
      stylelintplus = {
        autoFixOnSave = true,
        autoFixOnFormat = true
      }
    }
  })
end

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters, formatters and code actions <https://www.lunarvim.org/docs/configuration/language-features/linting-and-formatting>
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  -- { command = "stylua" },
  --   {
  --     command = "prettier",
  --     extra_args = { "--print-width", "100" },
  --     filetypes = { "typescript", "typescriptreact" },
  --   },
  { command = "prettierd" },
  { command = "eslint_d" }
}
local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  --   { command = "flake8", filetypes = { "python" } },
  --   {
  --     command = "shellcheck",
  --     args = { "--severity", "warning" },
  --   },
  { command = "eslint_d" }
}
local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    exe = "eslint_d",
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  },
}

-- -- Additional Plugins <https://www.lunarvim.org/docs/configuration/plugins/user-plugins>
lvim.plugins = {
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    config = function()
      require("typescript-tools").setup {
        settings = {
          tsserver_plugins = {
            -- https://github.com/pmizio/typescript-tools.nvim#-styled-components-support
            -- for TypeScript v4.9+
            "@styled/typescript-styled-plugin",
            -- or for older TypeScript versions
            -- "typescript-styled-plugin",
          },
        },
      }
    end,
  },
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    keys = {
      {
        "s",
        function() require("flash").jump() end,
        mode = { "n", "o", "x" },
        desc = "Flash"
      },
      {
        "S",
        function() require("flash").treesitter() end,
        mode = { "n", "o", "x" },
        desc = "Flash Treesitter"
      },
      {
        "r",
        function() require("flash").remote() end,
        mode = { "o" },
        desc = "Remote Flash"
      },
      {
        "R",
        function() require("flash").treesitter_search() end,
        mode = { "o", "x" },
        desc =
        "Treesitter Search"
      },
      {
        "<c-s>",
        function() require("flash").toggle() end,
        mode = { "c" },
        desc =
        "Toggle Flash Search"
      },
    },
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "HiPhish/nvim-ts-rainbow2",
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup(
        { "css", "scss", "html", "javascript", "typescript", "javascriptreact", "typescriptreact" }, {
          RGB = true,      -- #RGB hex codes
          RRGGBB = true,   -- #RRGGBB hex codes
          RRGGBBAA = true, -- #RRGGBBAA hex codes
          rgb_fn = true,   -- CSS rgb() and rgba() functions
          hsl_fn = true,   -- CSS hsl() and hsla() functions
          css = true,      -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
          css_fn = true,   -- Enable all CSS *functions*: rgb_fn, hsl_fn
        })
    end,
  },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    config = function()
      -- https://github.com/tzachar/cmp-tabnine#sorting
      local cmp_compare = require('cmp.config.compare')
      lvim.builtin.cmp.sorting = {
        priority_weight = 2,
        comparators = {
          require('cmp_tabnine.compare'),
          cmp_compare.offset,
          cmp_compare.exact,
          cmp_compare.score,
          cmp_compare.recently_used,
          cmp_compare.kind,
          cmp_compare.sort_text,
          cmp_compare.length,
          cmp_compare.order,
        },
      }
    end
  },
  {
    "rmagatti/goto-preview",
    config = function()
      require('goto-preview').setup {
        width = 120,             -- Width of the floating window
        height = 25,             -- Height of the floating window
        default_mappings = true, -- Bind default mappings
        debug = false,           -- Print debug information
        opacity = nil,           -- 0-100 opacity level of the floating window where 100 is fully transparent.
        post_open_hook = nil     -- A function taking two arguments, a buffer and a window to be ran as a hook.
        -- You can use "default_mappings = true" setup option
        -- Or explicitly set keybindings
        -- vim.cmd("nnoremap gpd <cmd>lua require('goto-preview').goto_preview_definition()<CR>")
        -- vim.cmd("nnoremap gpi <cmd>lua require('goto-preview').goto_preview_implementation()<CR>")
        -- vim.cmd("nnoremap gP <cmd>lua require('goto-preview').close_all_win()<CR>")
      }

      -- label
      require("which-key").register {
        gp = "Goto Preview",
        gpd = "Definition",
        gpt = "Type Definition",
        gpi = "Implementation",
        gP = "Close All Windows",
        gpr = "References"
      }
    end
  },
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require "lsp_signature".on_attach() end,
  },
  {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
  },
  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    config = function()
      require("todo-comments").setup()
    end,
  },
  {
    'echasnovski/mini.surround',
    version = false,
    config = function()
      require('mini.surround').setup({
        mappings = {
          add = '<c-s>a',            -- Add surrounding in Normal and Visual modes
          delete = '<c-s>d',         -- Delete surrounding
          find = '<c-s>f',           -- Find surrounding (to the right)
          find_left = '<c-s>F',      -- Find surrounding (to the left)
          highlight = '<c-s>h',      -- Highlight surrounding
          replace = '<c-s>r',        -- Replace surrounding
          update_n_lines = '<c-s>n', -- Update `n_lines`
        }
      })
    end
  },
  {
    'mg979/vim-visual-multi',
    branch = 'master'
  },
  {
    'brglng/vim-im-select'
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function()
      require('refactoring').setup()
    end,
    keys = {
      -- Extract function supports only visual mode
      {
        "<leader>re",
        function() require('refactoring').refactor('Extract Function') end,
        mode = { "x" },
        desc = 'Refactoring - Extract Function'
      },
      {
        "<leader>rf",
        function() require('refactoring').refactor('Extract Function To File') end,
        mode = { "x" },
        desc = 'Refactoring - Extract Function To File'
      },

      -- Extract variable supports only visual mode
      {
        "<leader>rv",
        function() require('refactoring').refactor('Extract Variable') end,
        mode = { "x" },
        desc = 'Refactoring - Extract Variable'
      },

      -- Inline var supports both normal and visual mode
      {
        "<leader>ri",
        function() require('refactoring').refactor('Inline Variable') end,
        mode = { "n", "x" },
        desc = 'Refactoring - Inline Variable'
      },

      -- Inline func supports only normal
      {
        "<leader>rI",
        mode = { "n" },
        function() require('refactoring').refactor('Inline Function') end,
        desc = 'Refactoring - Inline Function'
      },

      -- Extract block supports only normal mode
      {
        "<leader>rbb",
        function() require('refactoring').refactor('Extract Block') end,
        mode = { "n" },
        desc = 'Refactoring - Extract Block'
      },
      {
        "<leader>rbf",
        function() require('refactoring').refactor('Extract Block To File') end,
        mode = { "n" },
        desc = 'Refactoring - Extract Block To File'
      },

      -- prompt for a refactor to apply when the remap is triggered
      -- Note that not all refactor support both normal and visual mode
      {
        "<leader>rr",
        function() require('refactoring').select_refactor() end,
        mode = { "n", "x" },
        desc = 'Refactoring - Select Refactor'
      },

      -- You can also use below = true here to to change the position of the printf
      -- statement (or set two remaps for either one). This remap must be made in normal mode.
      {
        "<leader>rpp",
        function() require('refactoring').debug.printf({ below = false }) end,
        mode = { "n" },
        desc = 'Debug - Printf'
      },

      -- Print var
      -- Supports both visual and normal mode
      {
        "<leader>rpv",
        function() require('refactoring').debug.print_var() end,
        mode = { "x", "n" },
        desc = 'Debug - Print Var'
      },

      -- Supports only normal mode
      {
        "<leader>rc",
        function() require('refactoring').debug.cleanup({}) end,
        mode = { "n" },
        desc = 'Debug - Cleanup'
      }
    }
  },
  {
    "ruifm/gitlinker.nvim",
    dependencies = 'nvim-lua/plenary.nvim',
    config = function()
      require("gitlinker").setup()
    end
  }
}

-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
