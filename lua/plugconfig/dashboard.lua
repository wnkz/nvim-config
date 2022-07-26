local db = require("dashboard")

db.preview_file_height = 12
db.preview_file_width = 80
db.custom_center = {
  {
    icon = "  ",
    desc = "Recently latest session                 ",
    shortcut = "SPC s l",
    action = "SessionLoad"
  },
  {
    icon = "  ",
    desc = "Recently opened files                   ",
    action = "Telescope oldfiles",
    shortcut = "SPC f h"
  },
  {
    icon = "  ",
    desc = "Find File                              ",
    action = "Telescope find_files find_command=rg,--hidden,--files",
    shortcut = "SPC f f"
  },
  {
    icon = "  ",
    desc = "File Browser                            ",
    action = "Telescope file_browser",
    shortcut = "SPC f b"
  },
  {
    icon = "  ",
    desc = "Find Word                              ",
    action = "Telescope live_grep",
    shortcut = "SPC f w"
  }
}
