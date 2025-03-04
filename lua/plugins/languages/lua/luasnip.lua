return {
    'L3MON4D3/LuaSnip',
    tag = 'v2.3.0',

    build = 'make install_jsregexp',
    config = function()
        require('luasnip.loaders.from_vscode').lazy_load()
    end,
}
