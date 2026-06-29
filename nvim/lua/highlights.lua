-- ########################################################################
-- ######## Custom Highlight Groups
-- ########################################################################

local set_hl = vim.api.nvim_set_hl

set_hl(0, "Visual", { fg = "#575757", bg = "#d1d1d1" })
set_hl(0, "QuickFixLine", { fg = "#e8d8c5", bg = "#282828" })

set_hl(0, "LspDiagnosticsDefaultError", { fg = "#e5898b" })
set_hl(0, "LspDiagnosticsDefaultWarning", { fg = "#edbb7b" })
set_hl(0, "LspDiagnosticsDefaultHint", { fg = "#b1bbbf" })

set_hl(0, "SignifySignAdd", { fg = "#b8ba25" })
set_hl(0, "SignifySignDelete", { fg = "#fa4933" })
set_hl(0, "SignifySignChange", { fg = "#458488" })

set_hl(0, "ColorColumn", { bg = "#3a3a3a" })

set_hl(0, "VertSplit", { fg = "white", bg = "white" })
set_hl(0, "CursorLine", { bg = "#3d3d3d" })
set_hl(0, "SignColumn", { bg = "#282828" })

