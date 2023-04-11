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
  -- Session
  {
    'rmagatti/auto-session',
    log_level = "debug",
    auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads" },
    auto_save_enabled = true,
    auto_restore_enabled = true,
  }
}
