---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        "pyright",
        "clangd",
        -- nvim-treesitter's `main` branch builds parsers with the tree-sitter
        -- CLI. Releases from v0.26.0 onwards are linked against glibc 2.39,
        -- which is newer than this machine's glibc 2.35, so they fail to run.
        -- v0.25.10 is the last release that works here and it still generates
        -- ABI 15 parsers correctly.
        { "tree-sitter-cli", version = "v0.25.10" },
      },
    },
  },
}
