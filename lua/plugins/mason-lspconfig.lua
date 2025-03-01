return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = {
        {
            'williamboman/mason.nvim',
            lazy = false,

            config = function()
                require('mason').setup({})
            end,
        },
        {
            'neovim/nvim-lspconfig',
            dependencies = { {
                'hrsh7th/nvim-cmp',
                dependencies = { 'hrsh7th/cmp-nvim-lsp' },
            } },

            config = function()
                -- Reserve a space in the gutter
                -- This will avoid annoying layout shifts
                vim.opt.signcolumn = "yes"

                -- Add cmp_nvim_lsp capabilities
                -- This should be executed before you configure any language servers
                local lspconfig_defaults = require('lspconfig').util.default_config
                lspconfig_defaults.capabilities = vim.tbl_deep_extend(
                    'force',
                    lspconfig_defaults.capabilities,
                    require('cmp_nvim_lsp').default_capabilities()
                )

                -- This is where you enable features that only work
                -- of there is a language server active in the file
                vim.api.nvim_create_autocmd('LspAttach', {
                    desc = 'LSP Actions',
                    callback = function(event)
                        local opts = { buffer = event.buf }

                        vim.keymap.set('n', '<leader>info', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
                        vim.keymap.set('n', '<leader>def', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
                        vim.keymap.set('n', '<leader>dec', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
                        vim.keymap.set('n', '<leader>imp', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
                        vim.keymap.set('n', '<leader>type', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
                        vim.keymap.set('n', '<leader>ref', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
                        vim.keymap.set('n', '<leader>sig', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
                        vim.keymap.set('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
                        vim.keymap.set({'n', 'x'}, '<F3>', '<cmd>lua vim.lsp.buf.format({ async = true })<CR>', opts)
                        vim.keymap.set('n', '<F4>', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
                    end
                })
            end,
        },
    },
}
