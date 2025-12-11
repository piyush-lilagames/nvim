vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.keymap.set('n', '<leader><leader>', '<Cmd>w<CR>', { desc = 'Save file' })


vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc = "Restore session" })
vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end,
  { desc = "Restore last session" })
vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc = "Stop session saving" })
vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end)


-- Telescope keymaps
local ok, tb = pcall(require, "telescope.builtin")
if ok then
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", "<leader>ff", function() tb.find_files() end, opts)
  vim.keymap.set("n", "<leader>fg", function() tb.live_grep() end, opts)
  vim.keymap.set("n", "<leader>fb", function() tb.buffers() end, opts)
  vim.keymap.set("n", "<leader>fh", function() tb.help_tags() end)
  vim.keymap.set("n", "<leader>fr", function() tb.lsp_references() end, opts)
  vim.keymap.set("n", "<leader>fd", function() tb.lsp_definitions() end, opts)
  vim.keymap.set("n", "<leader>fe", function() tb.diagnostics() end, opts)
  vim.keymap.set("v", "<leader>fg", function()
    local _, ls, cs = unpack(vim.fn.getpos("'<"))
    local _, le, ce = unpack(vim.fn.getpos("'>"))

    -- Get selected text
    local lines = vim.fn.getline(ls, le)
    if #lines == 0 then return end

    lines[#lines] = string.sub(lines[#lines], 1, ce)
    lines[1] = string.sub(lines[1], cs)

    local query = table.concat(lines, "\n")

    require("telescope.builtin").live_grep({
      default_text = query,
    })
  end, { desc = "Live grep visual selection" })
end

local actions = require("telescope.actions")

require("telescope").setup({
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
      },
    },
  },
  pickers = {
    buffers = {
      sort_lastused = true,
      theme = "dropdown",
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer,
        },
        n = {
          ["d"] = actions.delete_buffer,
        },
      },
    },
  },
})

-- Nvim Tree
vim.keymap.set('n', '<leader>et', '<Cmd>NvimTreeToggle<CR>')
vim.keymap.set('n', '<leader>ef', '<Cmd>NvimTreeFocus<CR>')
vim.keymap.set('n', '<leader>ee', '<Cmd>NvimTreeFindFile<CR>')
