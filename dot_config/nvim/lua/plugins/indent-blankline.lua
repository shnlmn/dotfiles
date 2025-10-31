return {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
    config = function()
        local highlight = {
            "RainbowRed",
            "RainbowYellow",
            "RainbowBlue",
            "RainbowOrange",
            "RainbowGreen",
            "RainbowViolet",
            "RainbowCyan",
        }

        local hooks = require "ibl.hooks"
        -- create the highlight groups in the highlight setup hook, so they are reset
        -- every time the colorscheme changes
        hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
            vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#61454d" })
            vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#715250" })
            vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#756458" })
            vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#536a67" })
            vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#6b716c" })
            vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#61454d" })
            vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#61454d" })
        end)

        -- require('ibl').setup()
        require('ibl').setup { indent = { highlight = highlight } }
    end,
}
