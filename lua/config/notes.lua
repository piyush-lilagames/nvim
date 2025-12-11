local notes_win = nil
local notes_buf = nil
local prev_buf  = nil

function OpenNotes()
    prev_buf = vim.api.nvim_get_current_buf()

    local notes = vim.fn.expand("~/dev/personal/notes.md")
    vim.cmd("edit " .. notes)
    notes_buf = vim.api.nvim_get_current_buf()
    vim.api.nvim_set_current_buf(prev_buf)

    local width  = math.floor(vim.o.columns * 0.6)
    local height = math.floor(vim.o.lines * 0.6)
    local row    = math.floor((vim.o.lines - height) / 2)
    local col    = math.floor((vim.o.columns - width) / 2)

    notes_win    = vim.api.nvim_open_win(notes_buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = { "╔", "═", "╗", "║", "╝", "═", "╚", "║" }
    })

    -- allow closing with q
    vim.keymap.set("n", "q", CloseNotes, { buffer = notes_buf })
end

function CloseNotes()
    if notes_win and vim.api.nvim_win_is_valid(notes_win) then
        vim.cmd("write")
        vim.api.nvim_win_close(notes_win, true)
    end
    notes_win = nil
end

vim.keymap.set("n", "<leader>nn", OpenNotes)
vim.keymap.set("n", "<leader>nc", CloseNotes)
