local current_path = 'plugins.completion.'

return {
    require(current_path .. 'nvim-cmp'),
    require(current_path .. 'luasnip'),
    { 'saadparwaiz1/cmp_luasnip' },
    { 'rafamadriz/friendly-snippets' },
}
