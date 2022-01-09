lua << EOF
require('telescope').setup {
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = {"png", "webp", "jpg", "jpeg", "mp4", "pdf", "mkv"},
      find_cmd = "rg" -- find command (defaults to `fd`)
    }
  },
}
EOF
