return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',

    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-ui-select.nvim',
    },

    config = function()
        -- Setup Telescope
        require('telescope').load_extension('ui-select')

        -- Set Keymaps
        local builtin = require('telescope.builtin')

        vim.keymap.set('n', '<leader>tff', builtin.find_files, { desc = 'Telescope - Find Files' })
        vim.keymap.set('n', '<leader>tgf', builtin.git_files, { desc = 'Telescope - Find Git Files' })
        vim.keymap.set('n', '<leader>trg', builtin.live_grep, { desc = 'Telescope - Live Grep' })
        vim.keymap.set('n', '<leader>tb', builtin.buffers, { desc = 'Telescope - Current Buffers' })
        vim.keymap.set('n', '<leader>tof', builtin.oldfiles, { desc = 'Telescope - Old File' })
        vim.keymap.set('n', '<leader>tsh', builtin.search_history, { desc = 'Telescope - Search History' })
    end
}
