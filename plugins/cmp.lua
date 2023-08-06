return {
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local compare = require('cmp.config.compare')
      opts.sorting = { comparators = { compare.sort_text } }
      return opts
    end,
  }
}
