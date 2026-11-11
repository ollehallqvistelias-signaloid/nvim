-- Customize Treesitter
-- --------------------
-- As of AstroNvim v6 the parsers are configured through AstroCore.
-- nvim-treesitter's `main` branch is only a parser download utility,
-- so `ensure_installed` no longer lives on the nvim-treesitter spec.

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    treesitter = {
      highlight = true,
      indent = true,
      auto_install = true,
      ensure_installed = {
        "lua",
        "vim",
        "c",
        "cpp",
      },
    },
  },
}
