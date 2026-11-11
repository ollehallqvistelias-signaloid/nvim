-- This will run last in the setup process.
vim.opt.relativenumber = false
vim.opt.number = true

-- Right-click opens a context menu at the click position
vim.opt.mousemodel = "popup_setpos"

-- Ctrl+click -> LSP go to definition (click first to place cursor, then jump)
vim.keymap.set(
  "n",
  "<C-LeftMouse>",
  "<LeftMouse><Cmd>lua vim.lsp.buf.definition()<CR>",
  { desc = "LSP go to definition (ctrl-click)" }
)

-- Ctrl+right-click -> jump back through the tag stack
vim.keymap.set("n", "<C-RightMouse>", "<C-t>", { desc = "Jump back from definition" })

-- Inline diagnostics next to the offending code
vim.diagnostic.config {
  virtual_text = {
    spacing = 2,
    prefix = "●",
    source = "if_many",
  },
}
