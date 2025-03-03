return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
--    lazy = false,

    opts = {
        options = { theme = 'catppuccin' },
        extensions = {
            'lazy',
            'mason',
            'neo-tree',
            'nvim-dap-ui',
        },
    },
}
