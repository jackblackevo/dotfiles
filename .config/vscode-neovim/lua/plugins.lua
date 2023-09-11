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
    'echasnovski/mini.surround',
    version = false,
    config = function()
      require('mini.surround').setup()
    end
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
      }
    }
  }
})
