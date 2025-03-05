return {
    'p00f/clangd_extensions.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    cmd = {
        'ClangdSwitchSourceHeader',
        'ClangdAST',
        'ClangdSymbolInfo',
        'ClangdTypeHierarchy',
        'ClangdMemoryUsage',
    },
    ft = { 'c', 'cpp', 'h', 'hpp', 'cc', 'tpp', 'inc' },

    opts = {
        inlay_hints = { inline = false },
        ast = {
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },

            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            },
        },
    },

    keys = {
        { '<leader>cls', '<cmd>ClangdSwitchSourceHeader<CR>', desc = 'CLANGD Extension - Switch Source/Header File' },
        { '<leader>cla', '<cmd>ClangdAST<CR>', desc = 'CLANGD Extension - Show AST' },
        { '<leader>cli', '<cmd>ClangdSymbolInfo', desc = 'CLANGD Extension - Show Symbol Info' },
        { '<leader>clt', '<cmd>ClangdTypeHierarchy', desc = 'CLANGD Extension - Show Type Hierarchy' },
    },
}
