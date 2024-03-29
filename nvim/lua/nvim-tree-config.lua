return {
  update_focused_file = {
    enable = true,
    update_root = true
  },
  renderer = {
    highlight_git = true,
    root_folder_modifier = ":t",
    root_folder_label = false,
    icons = {
      show = {
        git = false,
        file = false,
        folder = false
      },
      glyphs = {
        folder = {
          arrow_open = "",
          arrow_closed = "",
        }
      }
    }
  },
  git = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = false,
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
    show_on_open_dirs = false,
    icons = {
      error = '✘',
      warning = '▲',
      hint = '⚑',
      info = '»'
    },
  },
  view = {
    width = 30,
    side = "left",
  }
}
