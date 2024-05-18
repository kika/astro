return {
  -- Configure AstroNvim updates
  updater = {
    remote = "origin",     -- remote to use
    channel = "stable",    -- "stable" or "nightly"
    version = "latest",    -- "latest", tag name, or regex search like "v1.*" to only do updates before v2 (STABLE ONLY)
    branch = "nightly",    -- branch name (NIGHTLY ONLY)
    commit = nil,          -- commit hash (NIGHTLY ONLY)
    pin_plugins = nil,     -- nil, true, false (nil will pin plugins on stable only)
    skip_prompts = false,  -- skip prompts about breaking changes
    show_changelog = true, -- show the changelog after performing an update
    auto_quit = false,     -- automatically quit the current session after a successful update
    remotes = {            -- easily add new remotes to track
      --   ["remote_name"] = "https://remote_url.come/repo.git", -- full remote url
      --   ["remote2"] = "github_user/repo", -- GitHub user/repo shortcut,
      --   ["remote3"] = "github_user", -- GitHub user assume AstroNvim fork
    },
  },
  -- Set colorscheme to use
  colorscheme = "astrodark",
  -- Icons overrides
  icons = {
  },
  -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
  diagnostics = {
    virtual_text = true,
    underline = true,
  },
  lsp = {
    -- customize lsp formatting options
    formatting = {
      -- control auto formatting on save
      format_on_save = {
        enabled = true,     -- enable or disable format on save globally
        allow_filetypes = { -- enable format on save for specified filetypes only
          -- "go",
        },
        ignore_filetypes = { -- disable format on save for specified filetypes
          -- "python",
        },
      },
      disabled = { -- disable formatting capabilities for the listed language servers
        -- disable lua_ls formatting capability if you want to use StyLua to format your lua code
        -- "lua_ls",
      },
      timeout_ms = 1000, -- default format timeout
      -- filter = function(client) -- fully override the default formatting function
      --   return true
      -- end
    },
    -- enable servers that you already have installed without mason
    servers = {
      -- "pyright"
    },
  },
  -- Configure require("lazy").setup() options
  lazy = {
    defaults = { lazy = true },
    performance = {
      rtp = {
        -- customize default disabled vim plugins
        disabled_plugins = { "tohtml", "gzip", "matchit", "zipPlugin", "netrwPlugin", "tarPlugin" },
      },
    },
  },
  -- This function is run last and is a good place to configuring
  -- augroups/autocommands and custom filetypes also this just pure lua so
  -- anything that doesn't fit in the normal config locations above can go here
  polish = function()
    -- Set up custom filetypes
    -- vim.filetype.add {
    --   extension = {
    --     foo = "fooscript",
    --   },
    --   filename = {
    --     ["Foofile"] = "fooscript",
    --   },
    --   pattern = {
    --     ["~/%.config/foo/.*"] = "fooscript",
    --   },
    -- }

    -- after some upgrade the vim.g.rustaceanvim.server became boolean and
    -- broke the plugin
    vim.g.rustaceanvim = {
      server = {}
    }
    --

    if vim.g.neovide then
      vim.g.neovide_underline_automatic_scaling = false
      vim.g.neovide_cursor_animation_length = 0
      vim.g.neovide_cursor_antialiasing = true
      vim.g.neovide_remember_window_size = true
      vim.g.neovide_remember_window_position = true
    end
    -- Restore last position in file
    vim.cmd [[autocmd BufReadPost * if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit' | exe "normal! g`\"" | endif]]
    -- reread file after a change on disk
    vim.cmd [[autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif]]
    vim.cmd [[autocmd FileChangedShellPost * lua vim.notify("File changed on disk. Buffer reloaded.")]]
    -- save the files when the focus is lost
    vim.cmd [[autocmd FocusLost * silent! wa]]
    -- Disable LSP semantic tokens, it's a giant fucking colorscheme mess
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        client.server_capabilities.semanticTokensProvider = nil
      end,
    })
    -- insert () after autocomplete function or method
    local cmp_aupair = require('nvim-autopairs.completion.cmp')
    require('cmp').event:on(
      'confirm_done',
      cmp_aupair.on_confirm_done()
    )
  end,
}
