local colors = require("red-phosphor.colors")
local M = {}

function M.groups()
    return {
        FzfLuaPathLineNr = { fg = colors.fg2 },
        FzfLuaBufNr = { fg = colors.fg2 },
        FzfLuaCursorLine = { bg = colors.bg3 },
        FzfLuaHeaderText = { fg = colors.red3 },
        FzfLuaHeaderBind = { fg = colors.purple5 },
    }
end

return M
