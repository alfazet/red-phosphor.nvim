local config = {
    defaults = {
        transparent = false,
        integrations = {},
        highlight_overrides = {},
        palette_overrides = {},
    },
}
setmetatable(config, { __index = config.defaults })

return config
