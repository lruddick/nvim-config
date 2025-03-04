local current_path = 'plugins.languages.markdown.'

for _, v in ipairs(require(current_path .. 'mason')) do
    table.insert(mason_required_list, v)   
end

return {
    require(current_path .. 'bullets'),
    require(current_path .. 'render-markdown'),
}
