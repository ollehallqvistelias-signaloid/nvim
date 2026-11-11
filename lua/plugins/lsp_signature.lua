---@type LazySpec
return {
  "ray-x/lsp_signature.nvim",
  event = "LspAttach",
  opts = {
    hint_enable = false,
    floating_window = true,
    floating_window_above_cur_line = true,
  },
  config = function(_, opts) require("lsp_signature").setup(opts) end,
}
