return {
    'kdheepak/lazygit.nvim',
    cmd = {
        'LazyGit',
        'LazyyGitConfig',
        'LazyGitCurrentFile',
        'LazyGitFilter',
        'LazyGitFilterCurrentFile',
    },

    dependencies = { 'nvim-lua/plenary.nvim' },

    keys = {
        { '<leader>lg', '<cmd>LazyGit<CR>', desc = 'LazyGit - Open' },
        { '<leader>lgc', '<cmd>LazyGitCurrentFile<CR>', desc = 'LazyGit - Current File' },
        { '<leader>lgf', '<cmd>LazyGitFilter<CR>', desc = 'LazyGit - Filter' },
    },
}
