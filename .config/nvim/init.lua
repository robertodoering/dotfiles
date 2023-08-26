if vim.g.vscode then
  require("vscode")
  return
end

require("options")
require("keymap")
require("plugins")
