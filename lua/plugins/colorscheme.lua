return {
  "nyoom-engineering/oxocarbon.nvim",
  priority = 1000, -- make sure to load before other plugins
  config = function()
    vim.cmd.colorscheme("oxocarbon")
  end,
}
