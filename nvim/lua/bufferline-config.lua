local colors = require('material.colors')
local fg = colors.editor.fg
local bg = colors.editor.contrast
local hint = colors.lsp.hint
local info = colors.lsp.info
local error = colors.main.darkred
local warning = colors.lsp.warning
local modified = colors.git.modified
local border = colors.editor.border

return {
  options = {
    -- numbers = "ordinal",
    show_close_icon = false,
    show_buffer_icons = false,
    diagnostics = "nvim_lsp",
    numbers = function(opts)
      return opts.raise(opts.ordinal)
    end,
  },
  highlights = {
    fill = { bg = bg, fg = fg },
    background = { bg = bg, fg = fg },
    tab = { bg = bg, fg = fg },
    close_button = { bg = bg },
    numbers = { bg = bg, fg = fg },
    separator = { bg = bg, fg = border },
    separator_selected = { bg = colors.editor.bg, fg = border },
    pick = { bg = bg },
    offset_separator = { bg = colors.editor.bg },
    hint = { fg = hint },
    hint_selected = { bold = false, italic = false, fg = hint },
    info = { fg = info },
    info_selected = { bold = false, italic = false, fg = info },
    modified = { fg = modified },
    modified_selected = { bold = false, italic = false, fg = modified },
    warning = { fg = warning },
    warning_selected = { bold = false, italic = false, fg = warning },
    error = { fg = error },
    error_selected = { bold = false, italic = false, fg = error },
    buffer_selected = { bold = false, italic = false, bg = colors.editor.bg },
    numbers_selected = { bold = false, italic = false },
    diagnostic_selected = { bold = false, italic = false },
  }
}
