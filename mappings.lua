-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  -- first key is the mode
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr)
          require("astronvim.utils.buffer").close(
            bufnr)
        end)
      end,
      desc = "Pick to close",
    },
    ["<D-w>"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },
    ["<D-]>"] = { function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end, desc =
    "Next buffer" },
    ["<D-[>"] = { function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end, desc =
    "Prev buffer" },
    ["<C-Tab>"] = { function() require("astronvim.utils.buffer").prev() end, desc = "Previous buffer" },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    -- quick save
    ["<D-s>"] = { ":w!<cr>", desc = "Save File" },
    -- Remap horizontal split
    ["\\"] = false,
    ["_"] = { "<Cmd>split<CR>", name = "Horizontal Split" },
    ["<D-v>"] = { '"*p' },
    ["<D-c>"] = { '"*y' },
    ["<D-x>"] = { '"*x' },
    ["<D-a>"] = { "ggVG" },
    -- Crates
    ['<leader>R'] = { name = "Crates" },
    ['<leader>Rt'] = { function() require('crates').toggle() end, desc = "Toggle crates" },
    ['<leader>Rr'] = { function() require('crates').reload() end, desc = "Reload crates" },
    ['<leader>Rv'] = { function() require('crates').show_versions_popup() end, desc = "Show versions" },
    ['<leader>Rf'] = { function() require('crates').show_features_popup() end, desc = "Show features" },
    ['<leader>Rd'] = { function() require('crates').show_dependencies_popup() end, desc = "Show deps" },
    ['<leader>Ru'] = { function() require('crates').update_crate() end, desc = "Update crate" },
    ['<leader>Ra'] = { function() require('crates').update_all_crates() end, desc = "Update all crates" },
    ['<leader>RU'] = { function() require('crates').upgrade_crate() end, desc = "Upgrade crate" },
    ['<leader>RA'] = { function() require('crates').upgrade_all_crates() end, desc = "Upgrade all crates" },
    ['<leader>Re'] = { function() require('crates').expand_plain_crate_to_inline_table() end, desc = "Expand crate to table" },
    ['<leader>RE'] = { function() require('crates').extract_crate_into_table() end, desc = "Extract crate into table" },
    ['<leader>RH'] = { function() require('crates').open_homepage() end, desc = "Open homepage" },
    ['<leader>RR'] = { function() require('crates').open_repository() end, desc = "Open repo" },
    ['<leader>RD'] = { function() require('crates').open_documentation() end, desc = "Open doc" },
    ['<leader>RC'] = { function() require('crates').open_crates_io() end, desc = "Open crates.io" },
    -- LSP
    ["<F12>"] = {
      function() vim.lsp.buf.definition() end,
      desc = "Show definition under cursor"
    },
    ["<S-F12>"] = {
      function() require("telescope.builtin").lsp_references() end,
      desc = "Show references to symbol under cursor"
    },
    ["<F8>"] = {
      function() vim.diagnostic.goto_next() end,
      desc = "Next diagnostic",
    },
    ["<D-.>"] = {
      function() vim.lsp.buf.code_action() end,
      desc = "LSP code action",
    },
    ["<F2>"] = {
      function() vim.lsp.buf.rename() end,
      desc = "LSP rename",
    },
    -- Trouble
    ["<leader>xx"] = { function() require("trouble").toggle() end},
    ["<leader>xw"] = { function() require("trouble").open("workspace_diagnostics") end},
    ["<leader>xd"] = { function() require("trouble").open("document_diagnostics") end},
    ["<leader>xq"] = { function() require("trouble").open("quickfix") end},
    ["<leader>xl"] = { function() require("trouble").open("loclist") end},
    ["gR"] = { function() require("trouble").open("lsp_references") end},
  },
  v = {
    ["<D-v>"] = { '"*p' },
    ["<D-c>"] = { '"*y' },
    ["<D-x>"] = { '"*x' },
    ["<D-s>"] = { "<C-C>:w<CR>" },
    ["<D-a>"] = { "<C-C>ggVG" },
    ['<leader>cU'] = { function() require('crates').upgrade_crates() end, desc = "Upgrade crates" },
    ['<leader>cu'] = { function() require('crates').update_crates() end, desc = "Update crates" },
  },
  i = {
    ["<D-v>"] = { "<C-R>*" },
    ["<D-s>"] = { "<C-O>:w<CR>" },
  },
  c = {
    ["<D-v>"] = { "<C-R>*" },

  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
