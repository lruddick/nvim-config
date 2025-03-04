-- require('user.auto-mason')

-- Personal Editor Settings
require("catppuccin").setup()
vim.cmd.colorscheme "catppuccin"

-- Four-Space Tabbing
vim.cmd('set expandtab')
vim.cmd('set tabstop=4')
vim.cmd('set softtabstop=4')
vim.cmd('set shiftwidth=4')

-- Line Numbers
vim.wo.number = true;
vim.keymap.set('n', '<leader>tn', function()
    vim.wo.relativenumber = not vim.wo.relativenumber
end, { desc = 'Line Numbers - Toggle Relative Numbering' })

-- 80-column indication
vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWinEnter' }, {
    pattern = { '*?.*' },
    command = 'let &colorcolumn = join(range(81,999), ",")',
})
