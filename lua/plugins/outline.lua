return {
    'hedyhli/outline.nvim',
    cmd = {
        'Outline',
        'OutlineOpen',
        'OutlineClose',
        'OutlineFocus'
    },

    opts = {
        outline_window = {
            auto_jump = false,
            jump_highlight_duration = 500,
            hide_cursor = true,
        },
        symbol_folding = { autofold_depth = 2 },
        symbols = { icon_source = 'lspkind' },
    },

    keys = {
        { '<leader>ot', '<cmd>Outline<CR>', desc = 'Outline - Toggle' },
        { '<leader>oo', '<cmd>OutlineOpen<CR>', desc = 'Outline - Open' },
        { '<leader>oc', '<cmd>OutlineClose<CR>', desc = 'Outline - Close' },
        { '<leader>of', '<cmd>OutlineFocus<CR>', desc = 'Outline - Focus' },
    },
}
