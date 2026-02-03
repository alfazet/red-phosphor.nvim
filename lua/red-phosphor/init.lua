local colors = require("red-phosphor.colors")
local config = require("red-phosphor.config")
local utils = require("red-phosphor.utils")
local theme = {}

function theme.setup(values)
    setmetatable(config, { __index = vim.tbl_extend("force", config.defaults, values) })
end

function theme.colorscheme()
    vim.api.nvim_command("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end
    vim.o.termguicolors = true
    vim.g.colors_name = "red-phosphor"

    for color, hex in pairs(config.palette_overrides) do
        colors[color] = hex
    end

    local bg = (config.transparent and "none") or colors.bg1
    local groups = {
        Normal = { bg = bg, fg = colors.fg1 },
        Comment = { fg = colors.fg3, italic = true },
        Constant = { fg = colors.peach1 },
        Define = { link = "Constant" },
        Macro = { link = "Constant" },
        Boolean = { fg = colors.red2 },
        String = { fg = colors.peach2 },
        Character = { fg = colors.peach2 },
        SpecialChar = { fg = colors.peach2 },
        Number = { fg = colors.fg4 },
        Float = { link = "Number" },

        Function = { fg = colors.pink3 },
        Identifier = { link = "Function" },
        Method = { link = "Function" },
        Property = { link = "Function" },
        Field = { link = "Function" },
        Parameter = { link = "Function" },
        Keyword = { fg = colors.red3 },
        Statement = { link = "Keyword" },
        Conditional = { link = "Keyword" },
        Label = { link = "Keyword" },
        PreProc = { link = "Keyword" },
        Operator = { fg = colors.fg2 },
        Type = { fg = colors.pink2 },
        Struct = { link = "Type" },
        Class = { link = "Type" },
        Exception = { link = "Type" },
        Delimiter = { fg = colors.fg2 },
        Special = { fg = colors.fg3 },
        SpecialKey = { fg = colors.mauve1 },
        Conceal = { fg = colors.mauve1 },

        LineNr = { fg = colors.fg4 },
        NonText = { link = "LineNr" },
        CursorLineNr = { fg = colors.fg2 },
        IncSearch = { bg = utils.mix(colors.yellow, colors.fg1, 0.75), fg = colors.bg1 },
        Substitute = { link = "IncSearch" },
        Search = { link = "IncSearch" },
        MatchParen = { bg = colors.fg1, fg = colors.bg1 },
        QuickFixLine = { fg = colors.fg5 },
        QuickFixList = { fg = colors.fg3 },
        Directory = { link = "QuickFixList" },
        StatusLine = { bg = bg, fg = colors.fg4 },
        Question = { link = "StatusLine" },
        MoreMsg = { link = "StatusLine" },
        ModeMsg = { link = "StatusLine" },
        Visual = { bg = colors.fg2, fg = colors.bg2 },
        VisualNOS = { link = "Visual" },
        PMenu = { bg = colors.bg2 },
        PMenuSel = { bg = colors.bg4 },
        ExtraWhitespace = { fg = colors.yellow },
        Ignore = { fg = colors.bg3 },
        Todo = { fg = colors.yellow, bold = true },
        Error = { fg = colors.red5 },
        Underlined = { underline = true },
        Bold = { bold = true },
        Italic = { italic = true },

        DiagnosticError = { fg = colors.red3 },
        DiagnosticWarn = { fg = colors.yellow },
        DiagnosticInfo = { fg = colors.peach3 },
        DiagnosticHint = { fg = colors.mauve3 },
        DiagnosticOk = { fg = colors.fg1 },

        DiagnosticUnderlineError = { undercurl = true },
        DiagnosticUnderlineWarn = { undercurl = true },
        DiagnosticUnderlineInfo = { undercurl = true },
        DiagnosticUnderlineHint = { undercurl = true },
        DiagnosticUnderlineOk = { undercurl = true },

        ["@text"] = { fg = colors.fg1 },
        ["@texcolors.literal"] = { link = "Property" },
        ["@texcolors.strong"] = { link = "Bold" },
        ["@texcolors.italic"] = { link = "Italic" },
        ["@texcolors.title"] = { link = "Keyword" },
        ["@texcolors.uri"] = { link = "String" },
        ["@texcolors.underline"] = { link = "Underlined" },
        ["@texcolors.todo"] = { link = "Todo" },
        ["@comment"] = { link = "Comment" },
        ["@constant"] = { link = "Constant" },
        ["@constant.builtin"] = { link = "Constant" },
        ["@constancolors.builtin"] = { link = "Keyword" },
        ["@string"] = { link = "String" },
        ["@string.escape"] = { link = "String" },
        ["@string.special"] = { link = "String" },
        ["@string.special.url"] = { link = "String" },
        ["@number"] = { link = "Number" },
        ["@boolean"] = { link = "Boolean" },
        ["@function"] = { link = "Function", italic = true },
        ["@function.call"] = { link = "Function" },
        ["@function.builtin"] = { link = "Function" },
        ["@parameter"] = { link = "Parameter" },
        ["@method"] = { link = "Function" },
        ["@field"] = { link = "Property" },
        ["@property"] = { link = "Property" },
        ["@label"] = { link = "Label" },
        ["@operator"] = { link = "Operator" },
        ["@exception"] = { link = "Exception" },
        ["@variable"] = { fg = colors.fg1, italic = true },
        ["@variable.builtin"] = { link = "Keyword" },
        ["@type"] = { link = "Type" },
        ["@type.definition"] = { link = "Type" },
        ["@type.builtin"] = { link = "Type" },
        ["@type.qualifier"] = { link = "Type" },
        ["@keyword"] = { link = "Keyword" },
        ["@namespace"] = { link = "Type" },
        ["@annotation"] = { link = "Label" },
        ["@attribute"] = { link = "Attribute" },
        ["@error"] = { link = "Error" },
        ["@punctuation.bracket"] = { link = "Special" },
    }

    for _, name in ipairs(config.integrations) do
        local plugin = require("red-phosphor.integrations." .. name)
        groups = vim.tbl_extend("force", groups, plugin.groups())
    end

    groups = vim.tbl_extend("force", groups, config.highlight_overrides)
    for group, parameters in pairs(groups) do
        vim.api.nvim_set_hl(0, group, parameters)
    end
end

return theme
