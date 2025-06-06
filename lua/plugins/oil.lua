return {
  "stevearc/oil.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("oil").setup({
      default_file_explorer = false,
      columns = {},
      keymaps = {
        ["<C-h>"] = false,
        ["<C-c>"] = false,
        ["<M-h>"] = "actions.select_split",
        ["q"] = "actions.close",
      },
      delete_to_trash = true,
      view_options = {
        show_hidden = true,
      },
      skip_confirm_for_simple_edits = true,
      float = {
        padding = 2,
        max_width = 60,
        max_height = 20,
        border = "rounded",
        win_options = {
          winblend = 10,
        },
      },
    })

    -- Keymap to open Oil in the current window
    vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

    -- Keymap to open Oil in a floating window
    vim.keymap.set("n", "<leader>-", require("oil").toggle_float, { desc = "Open Oil in float" })

    -- Optional: Highlight the current line in Oil buffer
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "oil",
      callback = function()
        vim.opt_local.cursorline = true
      end,
    })
  end,
}
