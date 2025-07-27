local colors = require("red-phosphor.colors")
local M = {}

function M.groups()
    return {
        FzfLuaPathLineNr = { fg = colors.fg2 },
        FzfLuaBufNr = { fg = colors.fg2 },
        FzfLuaCursorLine = { bg = colors.bg3 },
    }
end

return M
