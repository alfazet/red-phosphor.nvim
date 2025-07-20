local config = require("one-shot-dark.config")
local mix = require("one-shot-dark.utils").mix

local colors = {
    fg = "#FFFFFF",
    bg = "#000000",
    purple1 = "#722270",
    purple2 = "#7E3C99",
    red1 = "#6C1440",
    red2 = "#B12751",
    pink = "#DE4594",
    orange1 = "#341C20",
    orange2 = "#804C44",
    yellow = "#FBF785",

    -- background colors
    white = "#FFFFFF",
    black = "#000000",
    bgDark = "#000000",
    bgDarker = "#000000",
    bgFloat = "#000000",
    bgOption = "#000000",

    fgAlt = "#EEBBEE",
    fgCommand = "#EEBBEE",
    fgInactive = "#65737E",
    fgDisabled = "#505050",
    fgLineNr = "#505050",
    fgSelection = "#343434",
    fgSelectionInactive = "#505050",

    -- border colors
    border = "#505050",
    borderFocus = "#65737E",
    borderDarker = "#A0A0A0",

    -- ui colors
    greenLight = mix("#99FFE4", "#000000", math.abs(0.85)),
    red = "#FF8080",
    purple = "#FFCFA8",
    redDark = "#FF8080",
    orange = "#FFCFA8",
    primary = "#A0A0A0",
    comment = mix("#8b8b8b", "#000000", math.abs(0.90)),
    orangeLight = "#FFCFA8",
    green = mix("#99FFE4", "#000000", math.abs(0.85)),
    yellowDark = "#FFC799",
    purpleDark = mix("#65737E", "#000000", math.abs(0.80)),
    symbol = "#65737E",
    secondary = "#FFFFFF",
    terminalbrightblack = "#343434",

    -- diagnostic colors
    error = "#FF8080",
    warn = "#FFC799",
    info = "#99FFE4",
    hint = "#65737E",
}

return colors
