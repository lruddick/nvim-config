return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        { 'hrsh7th/cmp-nvim-lsp' },
        {
            'saadparwaiz1/cmp_luasnip',
            dependencies = {
                'L3MON4D3/LuaSnip',
                tag = 'v2.3.0',
                dependencies = { 'rafamadriz/friendly-snippets' },

                build = 'make install_jsregexp',
                config = function()
                    require('luasnip.loaders.from_vscode').lazy_load()
                end,
            },
        },
    },

    config = function()
        local cmp = require 'cmp'
        cmp.setup {
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-k>'] = cmp.mapping.scroll_docs(-4),
                ['<C-j>'] = cmp.mapping.scroll_docs(4),
                ['<C-space>'] = cmp.mapping.complete(),
                ['<C-q>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
            }),
            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }, {
                { name = 'buffer' },
            }),
        }
    end,
}
