return {
  "p00f/cphelper.nvim",
  dependenciesq = "nvim-lua/plenary.nvim",
  config = function()
    local home = os.getenv("HOME")
    vim.g["cph#dir"] = home .. "/Projects/competitive-programming"
    vim.g["cph#lang"] = "c"
  end,
}
