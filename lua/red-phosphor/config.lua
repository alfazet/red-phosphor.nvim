local config = {
    defaults = {
        transparent = false,
        integrations = {},
        overrides = {},
        palette_overrides = {},
    },
}
setmetatable(config, { __index = config.defaults })

return config
