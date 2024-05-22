local colors = {
  white = "#c0caf5",
  darker_black = "#16161e",
  black = "#1a1b26", --  nvim bg
  black2 = "#1f2336",
  one_bg = "#24283b",
  one_bg2 = "#414868",
  one_bg3 = "#353b45",
  grey = "#40486a",
  grey_fg = "#565f89",
  grey_fg2 = "#4f5779",
  light_grey = "#545c7e",
  red = "#f7768e",
  baby_pink = "#DE8C92",
  pink = "#ff75a0",
  line = "#32333e", -- for lines like vertsplit
  green = "#9ece6a",
  vibrant_green = "#73daca",
  nord_blue = "#80a8fd",
  blue = "#7aa2f7",
  yellow = "#e0af68",
  sun = "#EBCB8B",
  purple = "#bb9af7",
  dark_purple = "#9d7cd8",
  teal = "#1abc9c",
  orange = "#ff9e64",
  cyan = "#7dcfff",
  statusline_bg = "#1d1e29",
  lightbg = "#32333e",
  pmenu_bg = "#7aa2f7",
  folder_bg = "#7aa2f7",
}

return {
  {
    "folke/tokyonight.nvim",
    opts = {
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_highlights = function(hl, c)
        -- nvim-cmp highligts
        hl.Pmenu = { bg = c.none }
        hl.PmenuSbar = { bg = colors.one_bg }
        hl.PmenuSel = { bg = colors.pmenu_bg, fg = c.black }
        hl.PmenuThumb = { bg = colors.grey }
        hl.CmpItemAbbr = { fg = colors.white }
        hl.CmpItemAbbrMatch = { fg = colors.blue, bold = true }
        hl.CmpDoc = { bg = c.none }
        hl.CmpDocBorder = { fg = colors.grey_fg, bg = c.none }
        hl.CmpBorder = { fg = colors.grey_fg, bg = c.none }
        hl.CmpPmenu = { bg = c.none }
        hl.CmpSel = { bg = colors.pmenu_bg, fg = c.black }
      end,
    },
  },

  {
    "catppuccin/nvim",
    enabled = false,
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "mocha",
      transparent_background = true,
    },
  },
}
