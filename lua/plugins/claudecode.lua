-- Claude Code integration.
-- This is a community plugin, not an official Anthropic one. It runs a
-- websocket server and writes a lock file into `~/.claude/ide/`, which is the
-- same discovery mechanism the official VS Code extension uses. The `claude`
-- CLI finds Neovim through that lock file.
--
-- `snacks.nvim` is the only dependency and AstroNvim already installs it.

---@type LazySpec
return {
  "coder/claudecode.nvim",
  dependencies = { "folke/snacks.nvim" },
  config = true,
  cmd = {
    "ClaudeCode",
    "ClaudeCodeFocus",
    "ClaudeCodeSelectModel",
    "ClaudeCodeAdd",
    "ClaudeCodeSend",
    "ClaudeCodeTreeAdd",
    "ClaudeCodeStatus",
    "ClaudeCodeStart",
    "ClaudeCodeStop",
    "ClaudeCodeOpen",
    "ClaudeCodeClose",
    "ClaudeCodeDiffAccept",
    "ClaudeCodeDiffDeny",
    "ClaudeCodeCloseAllDiffs",
  },
  -- Register the `<Leader>a` prefix with which-key so the group has a name.
  specs = {
    {
      "AstroNvim/astrocore",
      ---@param opts AstroCoreOpts
      opts = function(_, opts)
        local maps = opts.mappings
        maps.n["<Leader>a"] = { desc = "Claude Code" }
        maps.v["<Leader>a"] = { desc = "Claude Code" }
      end,
    },
  },
  keys = {
    { "<Leader>ac", "<Cmd>ClaudeCode<CR>", desc = "Toggle Claude" },
    { "<Leader>af", "<Cmd>ClaudeCodeFocus<CR>", desc = "Focus Claude" },
    { "<Leader>ar", "<Cmd>ClaudeCode --resume<CR>", desc = "Resume Claude" },
    { "<Leader>aC", "<Cmd>ClaudeCode --continue<CR>", desc = "Continue Claude" },
    { "<Leader>am", "<Cmd>ClaudeCodeSelectModel<CR>", desc = "Select Claude model" },
    { "<Leader>ab", "<Cmd>ClaudeCodeAdd %<CR>", desc = "Add current buffer" },
    { "<Leader>as", "<Cmd>ClaudeCodeSend<CR>", mode = "v", desc = "Send selection to Claude" },
    {
      "<Leader>as",
      "<Cmd>ClaudeCodeTreeAdd<CR>",
      desc = "Add file from explorer",
      ft = { "neo-tree", "NvimTree", "oil", "minifiles", "netrw", "snacks_picker_list" },
    },
    { "<Leader>aa", "<Cmd>ClaudeCodeDiffAccept<CR>", desc = "Accept diff" },
    { "<Leader>ad", "<Cmd>ClaudeCodeDiffDeny<CR>", desc = "Deny diff" },
  },
}
