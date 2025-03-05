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
        clangd = function()
            local u = require('lspconfig.util')
            local capabilities = default_capabilities
            capabilities.offsetEncoding = { 'utf-16' }

            lspconfig.clangd.setup({
                root_dir = function(fname)
                    return u.root_pattern(
                        'Makefile',
                        'configure.ac',
                        'configure.in',
                        'config.h.in',
                        'meson.build',
                        'meson_options.txt',
                        'build.ninja'
                    )(fname) or u.root_pattern(
                        'compile_commands.json',
                        'compile_flags.txt'
                    )(fname) or u.find_git_ancestor(fname)
                end,
                capabilities = capabilities,
                cmd = {
                    'clangd',
                    '--background-index',
                    '--clang-tidy',
                    '--header-insertion=iwyu',
                    '--completion-style=detailed',
                    '--function-arg-placeholders',
                    'fallback-style=llvm',
                },
                init_options = {
                    usePlaceholders = true,
                    completeUnimported = true,
                    clangdFileStatus = true,
                },
            })
        end,
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
        require('none-ls.diagnostics.cpplint'),

        -- lua
        null_ls.builtins.formatting.stylua,

        -- markdown
        null_ls.builtins.diagnostics.markdownlint_cli2,
    }
})
