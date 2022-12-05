local colors = require('material.colors')
local border = colors.main.black

local bg = {
  default = colors.editor.bg,
  tab =  colors.editor.contrast
}

local text = {
  default = colors.editor.fg,
  hint = colors.lsp.hint,
  info = colors.lsp.info,
  error = colors.main.darkred,
  warning = colors.lsp.warning,
  modified = colors.git.modified,
  numbers = colors.editor.gray
}

local style = function(fg)
  return { fg = fg, bg = bg.tab }
end

local active_style = function(fg)
  return { fg = fg, bg = bg.default, bold = false, italic = false }
end

return {
  options = {
    show_close_icon = false,
    show_buffer_icons = false,
    diagnostics = "nvim_lsp",
    numbers = function(opts)
      return opts.raise(opts.ordinal)
    end,
  },
  highlights = {
    fill = { bg = bg.tab },
    background = style(text.default),
    tab = style(text.default),
    tab_selected = active_style(text.default),
    tab_close = style(text.default),
    close_button = style(text.default),
    close_button_visible = style(text.default),
    close_button_selected = active_style(text.default),
    buffer_visible = style(text.default),
    buffer_selected = active_style(text.default),
    numbers = style(text.numbers),
    numbers_visible = style(text.numbers),
    numbers_selected = active_style(text.numbers),
    diagnostic = style(text.default),
    diagnostic_visible = style(text.default),
    diagnostic_selected = active_style(text.default),
    hint = style(text.hint),
    hint_visible = style(text.hint),
    hint_selected = active_style(text.hint),
    hint_diagnostic = style(text.hint),
    hint_diagnostic_visible = style(text.hint),
    hint_diagnostic_selected = active_style(text.hint),
    info = style(text.info),
    info_visible = style(text.info),
    info_selected = active_style(text.info),
    info_diagnostic = style(text.info),
    info_diagnostic_visible = style(text.info),
    info_diagnostic_selected = active_style(text.info),
    warning = style(text.warning),
    warning_visible = style(text.warning),
    warning_selected = active_style(text.warning),
    warning_diagnostic = style(text.warning),
    warning_diagnostic_visible = style(text.warning),
    warning_diagnostic_selected = active_style(text.warning),
    error = style(text.error),
    error_visible = style(text.error),
    error_selected = active_style(text.error),
    error_diagnostic = style(text.error),
    error_diagnostic_visible = style(text.error),
    error_diagnostic_selected = active_style(text.error),
    modified = style(text.modified),
    modified_visible = style(text.modified),
    modified_selected = active_style(text.modified),
    duplicate = style(text.modified),
    duplicate_selected = active_style(text.modified),
    duplicate_visible = style(text.modified),
    separator = { fg = border, bg = bg.tab },
    separator_visible = { fg = border, bg = bg.tab },
    separator_selected = { fg = border, bg = bg.tab },
    indicator_selected = { fg = text.modified, bg = bg.default }
  }
}
