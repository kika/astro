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
    ["<C-a>"] = { "ggVG" },
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
  },
  v = {
    ["<D-v>"] = { '"*p' },
    ["<D-c>"] = { '"*y' },
    ["<D-x>"] = { '"*x' },
    ["<D-s>"] = { "<C-C>:w<CR>" },
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
