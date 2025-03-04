return {
    'bullets-vim/bullets.vim',

    config = function()
        vim.cmd('let g:bullets_enable_file_types = ' ..
            '["markdown", "text", "gitcommit"]')
        vim.cmd('let g:bullets_auto_indent_after_colon = 1')
        vim.cmd('let g:bullets_renumber_on_change = 1')
    end,
}
