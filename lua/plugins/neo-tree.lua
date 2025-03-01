return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = "v3.x",
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    lazy = false,

    -- build = "<cmd>Neotree filesystem reveal left<CR>:wqa",
    config = function()
        require('neo-tree').setup({
            auto_clean_after_session_restore = true,
            hide_root_node = true,
            sort_case_insensitive = true,

            filtered_items = {
                hide_dotfiles = false,
                hide_gitignored = false,
            },
        })
    end,

    keys = {
        { "<leader>nb", "<cmd>Neotree buffers toggle left<CR>", desc = 'Neotree - Toggle Buffers' },
        { "<leader>nf", "<cmd>Neotree filesystem toggle left<CR>", desc = 'Neotree - Toggle Filesystem' },
        { "<leader>ng", "<cmd>Neotree git_status toggle left<CR>", desc = 'Neotree - Toggle Git Status' },
    },
}
