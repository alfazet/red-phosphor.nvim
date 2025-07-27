local colors = require("red-phosphor.colors")
local M = {}

function M.groups()
    return {
        IblIndent = { fg = colors.purple1 },
        IblScope = { fg = colors.purple1 },
    }
end

return M
