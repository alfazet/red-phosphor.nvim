local colors = require("one-shot-dark.colors")
local M = {}

function M.highlights()
    return {
        IblIndent = { fg = colors.red },
    }
end

return M
