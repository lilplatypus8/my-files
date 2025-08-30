-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.env.PATH = "/usr/local/bin:/usr/bin:/bin:" .. (vim.env.PATH or "")

require("telescope").setup({
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "-u", -- thats the new thing
    },
  },
})
