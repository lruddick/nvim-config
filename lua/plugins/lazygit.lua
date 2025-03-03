return {
    'kdheepak/lazygit.nvim',
    cmd = {
        'LazyGit',
        'LazyGitConfig',
        'LazyGitCurrentFile',
        'LazyGitFilter',
        'LazyGitFilterCurrentFile',
    },

    dependencies = { 'nvim-lua/plenary.nvim' },

    keys = {
        { '<leader>lg', '<cmd>LazyGit<CR>', desc = 'LazyGit - Open' },
        { '<leader>lgc', '<cmd>LazyGitConfig<CR>', desc = 'LazyGit - Edit Config' },
        { '<leader>lgf', '<cmd>LazyGitCurrentFile<CR>', desc = 'LazyGit - Current File' },
        { '<leader>lgl', '<cmd>LazyGitFilter<CR>', desc = 'LazyGit - Commit Log' },
    },
}
