return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    lazy = false,

    config = function()
        require('lualine').setup({
            options = { theme = 'nightfly' },
            extensions = {
                'lazy',
                'mason',
                'neo-tree',
            },
        })
    end
}
