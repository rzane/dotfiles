return {
  update_focused_file = {
    enable = true,
    update_root = true
  },
  renderer = {
    highlight_git = true,
    root_folder_modifier = ":t",
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
  diagnostics = {
    enable = true,
    show_on_dirs = false,
  },
  view = {
    width = 30,
    side = "left",
  }
}
