if vim.g.vscode then
  require("options")
  require("keymap")
  vim.opt.showmode = true
else
  require("options")
  require("keymap")
  require("plugins")
end
