return {
    'nvimdev/dashboard-nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
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
                    {
                        icon = '󰋖 ', desc = 'Help',
                        group = 'DiagnosticFloatingError',
                        action = 'Telescope help_tags',
                        key = 'h'
                    }, {
                        icon = ' ', desc = 'New File',
                        group = 'DiagnosticFloatingWarn',
                        action = 'enew',
                        key = 'n'
                    }, {
                        icon = '󰱼 ', desc = 'Find File',
                        group = 'DiagnosticFloatingHint',
                        action = 'Telescope find_files',
                        key = 'f'
                    }, {
                        icon = '󱎸 ', desc = 'Search',
                        group = 'DiagnosticFloatingOk',
                        action = 'Telescope live_grep',
                        key = 's'
                    }, {
                        icon = '󰙅 ', desc = 'File Tree',
                        action = 'Neotree filesystem reveal float',
                        key = 't'
                    }, {
                        icon = '󰊢 ', desc = 'Git GUI',
                        group = '@variable',
                        action = 'LazyGit',
                        key = 'G'
                    }, {
                        icon = '󰤄 ', desc = 'Lazy GUI',
                        group = '@module.builtin',
                        action = 'Lazy',
                        key = 'L'
                    }, {
                        icon = '󱁤 ', desc = 'Mason GUI',
                        group = '@function',
                        action = 'Mason',
                        key = 'M'
                    }, {
                        icon = '󰚰 ', desc = 'Update Plugins',
                        group = '@attribute',
                        action = function()
                            vim.cmd('Lazy update')
                            vim.cmd('MasonUpdate')
                        end,
                        key = 'U'
                    },
                },
                project = {
                    enable = true,
                    limit = 8,
                    icon = ' ',
                    label = 'Recent Projects',
                    action = function(path)
                        vim.cmd.cd(path)
                        vim.cmd('Neotree filesystem reveal float')
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
