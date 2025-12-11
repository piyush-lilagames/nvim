return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require("lualine").setup({
                options = { theme = 'onedark' }

            })
            vim.api.nvim_set_hl(0, "GitSignsAddNr", { fg = "#9ece6a" })          -- green
            vim.api.nvim_set_hl(0, "GitSignsChangeNr", { fg = "#7aa2f7" })       -- blue
            vim.api.nvim_set_hl(0, "GitSignsDeleteNr", { fg = "#f7768e" })       -- red
            vim.api.nvim_set_hl(0, "GitSignsChangedeleteNr", { fg = "#e0af68" }) -- yellow
        end
    }
}
