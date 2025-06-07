return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local telescope = require("telescope")

    telescope.setup({
      defaults = {
        hidden = false, -- Do not show hidden files globally
        no_ignore = false, -- Respect .gitignore and other ignore files globally
        -- You can still add global file_ignore_patterns here if you wish
        file_ignore_patterns = { "node_modules/" },
      },
      -- ... other Telescope configurations
    })
  end,
}
