return {
    {
        "sainnhe/gruvbox-material",
        enabled = true,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_transparent_background = 1
            vim.g.gruvbox_material_foreground = "mix"
            vim.g.gruvbox_material_background = "hard"
            vim.g.gruvbox_material_ui_contrast = "high"
            vim.g.gruvbox_material_float_style = "bright"
            vim.g.gruvbox_material_statusline_style = "material"
            vim.g.gruvbox_material_cursor = "auto"
        end,
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "navarasu/onedark.nvim",
        priority = 1000, -- make sure to load this before all the other start plugins
        config = function()
            require('onedark').setup {
                style = 'darker',
            }
            require("onedark").load()
            vim.api.nvim_set_hl(0, "CursorLine", { bg = "#2c3822" })
            vim.api.nvim_set_hl(0, "visual", { bg = "#515c49" })
            vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#7aa2f7", bold = true })
        end
    }
}
