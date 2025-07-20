local colors = require("one-shot-dark.colors")
local M = {}

function M.highlights()
    return {
        FzfLuaPathLineNr = { fg = colors.blue },
        FzfLuaBufNr = { fg = colors.blue },
    }
end

return M
