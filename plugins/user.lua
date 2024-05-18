return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  -- {
  --   'nvim-treesitter/playground',
  --   cmd = {
  --     "TSPlaygroundToggle",
  --     "TSHighlightCapturesUnderCursor",
  --   },
  --   config = function()
  --     require('playground').setup {
  --       enable = true,
  --     }
  --   end
  -- },
  -- {
  --   "neovim/nvim-lspconfig",
  --   opts = {
  --     setup = {
  --       rust_analyzer = function()
  --         return true
  --       end,
  --     },
  --   },
  -- },
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    },
  },
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({
        panel = { enable = false },
        suggestion = { enable = false },
      })
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    after = { "copilot.lua" },
    config = function ()
      require("copilot_cmp").setup({
        event = { "InsertEnter", "LspAttach" },
        fix_pairs = true,
      })
    end
  }
}
