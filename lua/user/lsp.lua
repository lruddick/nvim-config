-- LSP Installation and Setup
local lspconfig = require('lspconfig')
local default_capabilities = require('cmp_nvim_lsp').default_capabilities()
require('mason-lspconfig').setup({
    auto_install = true,
    handlers = {
        function(server_name)
            lspconfig[server_name].setup({
                capabilities = default_capabilities
            })
        end,
        -- Special Server Configurations below: (server_name = function())
    }
})

-- LSP Diagnostics and Code
local null_ls = require('null-ls')
null_ls.setup({
    sources = {
        -- null-ls (none-ls) lsp initializations
        null_ls.builtins.diagnostics.cmake_lint,
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.cppcheck,
        null_ls.builtins.formatting.stylua,
        require('none-ls.diagnostics.cpplint'),
    }
})
