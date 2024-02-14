return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require "cmp"
      opts.sorting = {
        priority_weight = 2,
        comparators = {
          require('copilot_cmp.comparators').prioritize,
          require('cmp.config.compare').sort_text,
          cmp.config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
          cmp.config.compare.exact,
          cmp.config.compare.score,
          cmp.config.compare.recently_used,
          cmp.config.compare.locality,
          cmp.config.compare.kind,
          cmp.config.compare.length,
          cmp.config.compare.order,
        }
      }
      opts.sources = cmp.config.sources {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "copilot", priority = 700 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      }
      return opts
    end,
  }
}
