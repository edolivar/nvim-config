-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- Normal mode
keymap.set("n", "<C-j>", "<Esc>:m .+1<CR>==", opts)
keymap.set("n", "<C-k>", "<Esc>:m .-2<CR>==", opts)

-- Visual mode (reselects the text after move)
keymap.set("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap.set("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)

keymap.set("n", "<C-d>", "<C-d>zz", { desc = "move down in buffer with cursor centered" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "move up in buffer with cursor centered" })
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("v", "<", "<gv", opts)
keymap.set("v", ">", ">gv", opts)

keymap.set("x", "<leader>p", [["_dP]])

-- remember yanked
keymap.set("v", "p", '"_dp', opts)

-- Copies or Yank to system clipboard
keymap.set("n", "<leader>Y", [["+Y]], opts)

-- leader d delete wont remember as yanked/clipboard when delete pasting
keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- ctrl c as escape cuz Im lazy to reach up to the esc key
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n", "<C-c>", ":nohl<CR>", { desc = "Clear search hl", silent = true })

-- prevent x delete from registering when next paste
keymap.set("n", "x", '"_x', opts)

-- Replace the word cursor is on globally
keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Replace word cursor is on globally" }
)
-- Hightlight yanking
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Copy filepath to the clipboard
keymap.set("n", "<leader>fp", function()
  local filePath = vim.fn.expand("%:~") -- Gets the file path relative to the home directory
  vim.fn.setreg("+", filePath) -- Copy the file path to the clipboard register
  print("File path copied to clipboard: " .. filePath) -- Optional: print message to confirm
end, { desc = "Copy file path to clipboard" })

-- opens parent dir over current active window
keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- open parent dir in float window
keymap.set("n", "<leader>-", require("oil").toggle_float)
