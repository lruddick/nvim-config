-- List of Packages to Auto-Install
local packages = {
    'clangd',
    'cmake-language-server',
    'cmakelint',
    'codespell',
    'cpplint',
    'lua-language-server',
    'stylua',
}

-- Non-GUI Mason API Mirrors
local mason_api = require('mason.api.command')
local mason_func = require('mason-core.functional')
local mason_platform = require "mason-core.platform"

local filter_valid_packages = mason_func.filter(function(pkg_specifier)
    local notify = require "mason-core.notify"
    local Package = require "mason-core.package"
    local registry = require "mason-registry"
    local package_name = Package.Parse(pkg_specifier)
    local ok = pcall(registry.get_package, package_name)
    if ok then
        return true
    else
        notify(("%q is not a valid package."):format(pkg_specifier), vim.log.levels.ERROR)
        return false
    end
end)

---@param package_specifiers string[]
---@param opts? PackageInstallOpts
local function MasonInstall(package_specifiers, opts)
    opts = opts or {}
    local Package = require "mason-core.package"
    local registry = require "mason-registry"

    local install_packages = mason_func.map(function(pkg_specifier)
        local package_name, version = Package.Parse(pkg_specifier)
        local pkg = registry.get_package(package_name)
        return pkg:install {
            version = version,
            debug = opts.debug,
            force = opts.force,
            strict = opts.strict,
            target = opts.target,
        }
    end)

    if mason_platform.is_headless then
        registry.refresh()
        local valid_packages = filter_valid_packages(package_specifiers)
        if #valid_packages ~= #package_specifiers then
            return vim.cmd [[1cq]]
        end

        mason_api.join_handles(install_packages(valid_packages))
    else
        registry.refresh(function()
            local valid_packages = filter_valid_packages(package_specifiers)
            install_packages(valid_packages)
        end)
    end
end

local function MasonUpdate()
    local notify = require "mason-core.notify"
    local registry = require "mason-registry"
    notify "Updating registries..."

    ---@param success boolean
    ---@param updated_registries RegistrySource[]
    local function handle_result(success, updated_registries)
        if success then
            local count = #updated_registries
            notify(("Successfully updated to %d %s."):format(count, count == 1 and "registry" or "registries"))
        else
            notify(("FFailed to update registries: %s"):format(updated_registries), vim.log.levels.ERROR)
        end
    end

    if mason_platform.is_headless then
        local a = require "mason-core.async"
        a.run_blocking(function()
            local success, updated_registries = a.wait(registry.update)
            a.scheduler()
            handle_result(success, updated_registries)
        end)
    else
        registry.update(mason_func.scheduler_wrap(handle_result))
    end
end

-- Ensure packages are installed
local mason_registry = require('mason-registry')
local index = 1
while (index <= #packages) do
    if mason_registry.is_installed(packages[index]) then
        table.remove(packages, index)
    else
        index = index + 1
    end
end

MasonInstall(packages)
MasonUpdate()

-- LSP Initialization
require('user.lsp')
