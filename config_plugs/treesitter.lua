require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "css", "html", "javascript", "vim", "bash", "lua" },
  sync_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}
