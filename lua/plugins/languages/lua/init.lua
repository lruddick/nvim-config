local current_path = 'plugins.languages.lua.'

for _, v in ipairs(require(current_path .. 'mason')) do
    table.insert(mason_required_list, v)   
end

return {
    require(current_path .. 'luasnip'),
    { 'saadparwaiz1/cmp_luasnip' },
}
