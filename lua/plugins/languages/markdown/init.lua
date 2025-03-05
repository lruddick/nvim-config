local current_path = 'plugins.languages.markdown.'

return {
    require(current_path .. 'bullets'),
    require(current_path .. 'render-markdown'),
}
