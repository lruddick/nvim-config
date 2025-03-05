local func = require 'mason-core.functional'

local filter_valid_packages = func.filter(function(package)
    local notify = require 'mason-core.notify'
    local Package = require 'mason-core.package'
    local registry = require 'mason-registry'
    local name = Package.Parse(package)

    local ok = pcall(registry.get_package, name)

    if ok then
        return true
    else
        notify(('%q is not a valid package.'):format(package), vim.log.levels.ERROR)
        return false
    end
end)

local function Install(package_list)
    local Package = require 'mason-core.package'
    local registry = require 'mason-registry'

    local install_packages = func.map(function(package)
        local name, version = Package.Parse(package)
        return registry.get_package(name):install {
            version = version
        }
    end)

    registry.refresh(function()
        local valid_list = filter_valid_packages(package_list)
        install_packages(valid_list)
    end)
end

local function Update()
    local notify = require 'mason-core.notify'
    local registry = require 'mason-registry'
    notify 'Updating registries...'

    local function handle_result(success, updated_registries)
        if success then
            local count = #updated_registries
            notify(('Successfully updated to %d %s.'):format(count, count == 1 and 'registry' or 'registries'))
        else
            notify(('Failed to update registries %s'):format(updated_registries), vim.log.levels.ERROR)
        end
    end

    registry.update(func.scheduler_wrap(handle_result))
end

local function SmartInstall(package_list)
    local registry = require 'mason-registry'

    local index = 1
    while (index <= #package_list) do
        if registry.is_installed(package_list[index]) then
            table.remove(package_list, index)
        else
            index = index + 1
        end
    end

    Install(package_list)
end

return {
    Install = Install,
    SmartInstall = SmartInstall,
    Update = Update,
}
