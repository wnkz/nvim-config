return {
  cmd = {
    "clangd",
    "--completion-style=detailed",
    "--offset-encoding=utf-16", -- fix: warning: multiple different client offset_encodings
  },
}
