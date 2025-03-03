return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
        flavour = 'mocha',
        integrations = {
            cmp = true,
            dap = true,
            dap_ui = true,
            dashboard = true,
            mason = true,
            native_lsp = {
                enabled = true,
                virtual_text = {
                    errors = { 'italic' },
                    hints = { 'italic' },
                    warnings = { 'italic' },
                    information = { 'italic' },
                    ok = { 'italic' },
                },
                underlines = {
                    errors = { 'underline' },
                    hints = { 'underline' },
                    warnings = { 'underline' },
                    information = { 'underline' },
                    ok = { 'underline' },
                },
                inlay_hints = { background = true },
            },
            neotree = true,
            telescope = {
                enabled = true,
            },
            treesitter = true,
        },
    },
}
