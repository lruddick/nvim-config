-- Install Mason Packages
local u = require('utils.mason')

-- Language Mason Packages
u.SmartInstall(require('plugins.languages.mason'))

local languages = {
    'lua',
    'markdown',
}
for _, sd in ipairs(languages) do
    u.SmartInstall(require(('plugins.languages.%s.mason'):format(sd)))
end
