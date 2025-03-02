return {
    'nvimdev/dashboard-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    event = 'VimEnter',

    config = function()
        local header = {
            [[                                                        ]],
            [[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗ ]],
            [[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║ ]],
            [[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║ ]],
            [[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║ ]],
            [[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║ ]],
            [[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝ ]],
            [[                                                        ]],
            [[                                                        ]],
        }
        table.insert(header, os.date('%Y-%M-%D %H:%M:%S') .. ' - Dashboard by Logan Ruddick')
        table.insert(header, '')

        require('dashboard').setup {
            theme = 'hyper',
            shortcut_type = 'number',
            config = {
                header = header,
                shortcut = {
                    { icon = '󰋖 ', desc = 'Help', action = 'Telescope help_tags', key = 'h' },
                    { icon = ' ', desc = 'New File', action = 'enew', key = 'n' },
                    { icon = ' ', desc = 'Find File', action = 'Telescope find_files', key = 'f' },
                    { icon = '󰙅 ', desc = 'File Tree', action = 'Neotree filesystem reveal current', key = 't' },
                    { icon = '󰚰 ', desc = 'Lazy Update', action = 'Lazy update', key = 'L' },
                    { icon = '󰚰 ', desc = 'Mason Update', action = 'MasonUpdate', key = 'M' },
                },
                project = {
                    enable = true,
                    limit = 8,
                    icon = ' ',
                    label = 'Recent Projects',
                    action = function(path)
                        vim.cmd.cd(path)
                        vim.cmd('Neotree filesystem reveal current')
                    end,
                },
                footer = {}
            },
        }

    end,

    keys = {
        { '<leader>D', '<cmd>Dashboard<CR>', desc = 'Dashboard - Open' },
    },
}
