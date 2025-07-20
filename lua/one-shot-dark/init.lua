local colors = require("one-shot-dark.colors")
local config = require("one-shot-dark.config")
local utils = require("one-shot-dark.utils")
local cmp = require("one-shot-dark.integrations.cmp")
local fzf = require("one-shot-dark.integrations.fzf")
local ibl = require("one-shot-dark.integrations.ibl")
local theme = {}

local function set_terminal_colors()
    vim.g.terminal_color_0 = colors.bg
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_3 = colors.yellowDark
    vim.g.terminal_color_4 = colors.greenLight
    vim.g.terminal_color_5 = colors.purple
    vim.g.terminal_color_6 = colors.primary
    vim.g.terminal_color_7 = colors.fg
    vim.g.terminal_color_8 = colors.fgInactive
    vim.g.terminal_color_9 = colors.redDark
    vim.g.terminal_color_10 = colors.orangeLight
    vim.g.terminal_color_11 = colors.orange
    vim.g.terminal_color_12 = colors.symbol
    vim.g.terminal_color_13 = colors.red
    vim.g.terminal_color_14 = colors.orangeLight
    vim.g.terminal_color_15 = colors.comment
    vim.g.terminal_color_background = colors.bg
    vim.g.terminal_color_foreground = colors.fg
end

local function set_groups()
    for color, hex in pairs(config.palette_overrides) do
        colors[color] = hex
    end

    local bg = config.transparent and "none" or colors.bg
    local diff_add = utils.shade(colors.green, 0.5, colors.bg)
    local diff_delete = utils.shade(colors.red, 0.5, colors.bg)
    local diff_change = utils.shade(colors.orange, 0.5, colors.bg)
    local diff_text = utils.shade(colors.symbol, 0.5, colors.bg)

    local groups = {
        -- base
        Normal = { fg = colors.fg, bg = bg },
        LineNr = { fg = colors.fgLineNr },
        ColorColumn = { bg = utils.shade(colors.primary, 0.5, colors.bg) },
        Conceal = {},
        Cursor = { fg = colors.bg, bg = colors.fg },
        lCursor = { link = "Cursor" },
        CursorIM = { link = "Cursor" },
        CursorLine = { bg = colors.bgOption },
        CursorColumn = { link = "CursorLine" },
        Directory = { fg = colors.green },
        DiffAdd = { bg = bg, fg = diff_add },
        DiffChange = { bg = bg, fg = diff_change },
        DiffDelete = { bg = bg, fg = diff_delete },
        DiffText = { bg = bg, fg = diff_text },
        EndOfBuffer = { fg = colors.purple1 },
        TermCursor = { link = "Cursor" },
        TermCursorNC = { link = "Cursor" },
        ErrorMsg = { fg = colors.error },
        VertSplit = { fg = colors.border, bg = bg },
        Winseparator = { link = "VertSplit" },
        SignColumn = { link = "Normal" },
        Folded = { fg = colors.fg, bg = colors.bgDarker },
        FoldColumn = { link = "SignColumn" },
        IncSearch = { bg = utils.shade(colors.orange, 0.90, colors.bg), fg = colors.bgDarker },
        Substitute = { link = "IncSearch" },
        CursorLineNr = { fg = colors.white },
        MatchParen = { fg = colors.primary, bg = bg },
        MatchParen = { fg = colors.primary, bg = bg },
        ModeMsg = { link = "Normal" },
        MsgArea = { link = "Normal" },
        MoreMsg = { fg = colors.greenLight },
        NonText = { fg = utils.shade(colors.bg, 0.30) },
        NormalFloat = { bg = colors.bgFloat },
        NormalNC = { link = "Normal" },
        Pmenu = { link = "NormalFloat" },
        PmenuSel = { bg = colors.bgOption },
        PmenuSbar = { bg = utils.shade(colors.greenLight, 0.5, colors.bg) },
        PmenuThumb = { bg = utils.shade(colors.bg, 0.20) },
        Question = { fg = colors.greenLight },
        QuickFixLine = { fg = colors.greenLight },
        SpecialKey = { fg = colors.symbol },
        StatusLine = { fg = colors.fg, bg = bg },
        StatusLineNC = { fg = colors.fgInactive, bg = colors.bgDark },
        TabLine = { bg = colors.bgDark, fg = colors.fgInactive },
        TabLineFill = { link = "TabLine" },
        TabLineSel = { bg = colors.bg, fg = colors.fgAlt },
        Search = { link = "IncSearch" },
        SpellBad = { undercurl = true, sp = colors.primary },
        SpellCap = { undercurl = true, sp = colors.greenLight },
        SpellLocal = { undercurl = true, sp = colors.purple1 },
        SpellRare = { undercurl = true, sp = colors.orange },
        Title = { fg = colors.greenLight },
        Visual = { bg = utils.shade(colors.bgDarker, 0.70) },
        VisualNOS = { link = "Visual" },
        WarningMsg = { fg = colors.warn },
        Whitespace = { fg = colors.symbol },
        WildMenu = { bg = colors.bgOption },
        Comment = { fg = colors.comment, italic = config.italics.comments or false },

        Constant = { fg = colors.white },
        String = { fg = colors.purple2, italic = config.italics.strings or false },
        Character = { fg = colors.green },
        Number = { fg = colors.secondary, bold = true },
        Boolean = { fg = colors.greenLight },
        Float = { link = "Number" },

        Identifier = { fg = colors.fg },
        Function = { fg = colors.red2 },
        Method = { fg = colors.red2 },
        Property = { fg = colors.greenLight },
        Field = { link = "Property" },
        Parameter = { fg = colors.fg },
        Statement = { fg = colors.primary },
        Conditional = { fg = colors.primary },
        Label = { fg = colors.greenLight },
        Operator = { fg = colors.primary },
        Keyword = { link = "Statement", italic = config.italics.keywords or false },
        Exception = { fg = colors.purple1 },

        PreProc = { link = "Keyword" },
        Define = { fg = colors.red2 },
        Macro = { link = "Define" },
        PreCondit = { fg = colors.primary },

        Type = { fg = colors.fg },
        Struct = { link = "Type" },
        Class = { link = "Type" },

        Attribute = { fg = colors.primary },
        Punctuation = { fg = colors.symbol },
        Special = { fg = colors.symbol },

        SpecialChar = { fg = colors.orangeLight },
        Tag = { fg = colors.orange },
        Delimiter = { fg = colors.symbol },
        Debug = { fg = colors.purple1Dark },

        Underlined = { underline = true },
        Bold = { bold = true },
        Italic = { italic = true },
        Ignore = { fg = colors.bg },
        Error = { link = "ErrorMsg" },
        Todo = { fg = colors.orange, bold = true },

        ["@text"] = { fg = colors.fg },
        ["@texcolors.literal"] = { link = "Property" },
        ["@texcolors.strong"] = { link = "Bold" },
        ["@texcolors.italic"] = { link = "Italic" },
        ["@texcolors.title"] = { link = "Keyword" },
        ["@texcolors.uri"] = { fg = colors.green, sp = colors.green, underline = true },
        ["@texcolors.underline"] = { link = "Underlined" },
        ["@symbol"] = { fg = colors.symbol },
        ["@texcolors.todo"] = { link = "Todo" },
        ["@comment"] = { link = "Comment" },
        ["@punctuation"] = { link = "Punctuation" },
        ["@punctuation.bracket"] = { fg = colors.primary },
        ["@punctuation.delimiter"] = { link = "Delimiter" },
        ["@punctuation.separator.keyvalue"] = { fg = colors.primary },

        ["@texcolors.diff.add"] = { fg = colors.green },
        ["@texcolors.diff.delete"] = { fg = colors.redDark },

        ["@constant"] = { link = "Constant" },
        ["@constant.builtin"] = { link = "Constant" },
        ["@constancolors.builtin"] = { link = "Keyword" },
        ["@string"] = { link = "String" },
        ["@string.escape"] = { fg = utils.shade(colors.yellowDark, 0.45) },
        ["@string.special"] = { fg = utils.shade(colors.yellowDark, 0.45) },
        ["@string.special.url"] = { underline = true },
        ["@number"] = { link = "Number" },
        ["@boolean"] = { link = "Boolean" },
        ["@function"] = { link = "Function", italic = config.italics.functions or false },
        ["@function.call"] = { link = "Function" },
        ["@function.builtin"] = { link = "Function" },
        ["@parameter"] = { link = "Parameter" },
        ["@method"] = { link = "Function" },
        ["@field"] = { link = "Property" },
        ["@property"] = { fg = colors.orange },
        ["@constructor"] = { fg = colors.primary },
        ["@label"] = { link = "Label" },
        ["@operator"] = { link = "Operator" },
        ["@exception"] = { link = "Exception" },
        ["@variable"] = { fg = colors.white, italic = config.italics.variables or false },
        ["@variable.builtin"] = { fg = colors.white, italic = config.italics.variables or false },
        ["@type"] = { fg = colors.orange },
        ["@type.definition"] = { fg = colors.fg },
        ["@type.builtin"] = { fg = colors.orange },
        ["@type.qualifier"] = { fg = colors.orange },
        ["@keyword"] = { link = "Keyword" },
        ["@namespace"] = { link = "Type" },
        ["@annotation"] = { link = "Label" },
        ["@debug"] = { fg = colors.purple1Dark },
        ["@tag"] = { link = "Tag" },
        ["@_tag"] = { link = "Tag" },
        ["@tag.builtin"] = { link = "Tag" },
        ["@tag.delimiter"] = { fg = colors.primary },
        ["@tag.attribute"] = { fg = colors.primary },
        ["@attribute"] = { link = "Attribute" },
        ["@error"] = { link = "Error" },
        ["@warning"] = { link = "WarningMsg" },
        ["@info"] = { fg = colors.green },
        ["@markup.link.label"] = { underline = false },
        ["@none"] = { fg = colors.white },
    }

    -- integrations
    groups = vim.tbl_extend("force", groups, cmp.highlights())
    groups = vim.tbl_extend("force", groups, fzf.highlights())
    groups = vim.tbl_extend("force", groups, ibl.highlights())

    -- overrides
    groups =
        vim.tbl_extend("force", groups, type(config.overrides) == "function" and config.overrides() or config.overrides)

    for group, parameters in pairs(groups) do
        vim.api.nvim_set_hl(0, group, parameters)
    end
end

function theme.setup(values)
    setmetatable(config, { __index = vim.tbl_extend("force", config.defaults, values) })
end

function theme.colorscheme()
    vim.api.nvim_command("hi clear")
    if vim.fn.exists("syntax_on") then
        vim.api.nvim_command("syntax reset")
    end

    vim.g.VM_theme_set_by_colorscheme = true -- Required for Visual Multi
    vim.o.termguicolors = true
    vim.g.colors_name = "one-shot-dark"

    set_terminal_colors()
    set_groups()
end

return theme
