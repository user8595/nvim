-- telescope & nvimtree
vim.keymap.set("n", "<S-o>", "<Cmd>NvimTreeToggle<CR>", { noremap = true, desc = "Open File Tree" })
vim.keymap.set("n", "<A-t>", "<Cmd>Telescope<CR>", { noremap = true, desc = "Launch Telescope" })
vim.keymap.set("n", "<A-o>", "<Cmd>Telescope oldfiles<CR>", { noremap = true, desc = "Open Recent Files" })
vim.keymap.set("n", "<A-g>", "<Cmd>Telescope live_grep<CR>", { noremap = true, desc = "Search in pwd" })

-- utility
vim.keymap.set({ "n", "i" }, "<C-s>", "<Cmd>w<CR>", { noremap = true, desc = "Save File" })
vim.keymap.set("n", "<C-N>", "<Cmd>new<CR>", { noremap = true, desc = "New Buffer In Current Buffer" })
vim.keymap.set("n", "<C-1>", "<Cmd>bdel<CR>", { noremap = true, desc = "Delete Current Buffer" })
vim.keymap.set("n", "<C-p>", function() require("persistence").select() end,
  { noremap = true, desc = "Load Recent Sessions" })

-- navigation
vim.keymap.set({ "n", "i", "v", "c" }, "<C-Home>", "<Cmd>bp<CR>", { noremap = true, desc = "Move To Next Buffer" })
vim.keymap.set({ "n", "i", "v", "c" }, "<C-End>", "<Cmd>bn<CR>", { noremap = true, desc = "Move To Previous Buffer" })
vim.keymap.set({ "n", "i", "v", "c" }, "<C-Tab>", "<Cmd>bn<CR>", { noremap = true, desc = "Move To Next Buffer" })
vim.keymap.set({ "n", "i", "v", "c" }, "<S-Tab>", "<Cmd>bp<CR>", { noremap = true, desc = "Move To Previous Buffer" })

vim.keymap.set({ "n", "i", "v", "c" }, "<A-[>", "<Cmd>bp<CR>", { noremap = true, desc = "Move To Next Buffer" })
vim.keymap.set({ "n", "i", "v", "c" }, "<A-]>", "<Cmd>bn<CR>", { noremap = true, desc = "Move To Previous Buffer" })

vim.keymap.set({ "n", "i", "v", "c" }, "<C-PageUp>", "<Cmd>tabp<CR>", { noremap = true, desc = "Move To Prev Tab" })
vim.keymap.set(
  { "n", "i", "v", "c" },
  "<C-PageDown>",
  "<Cmd>tabn<CR>",
  { noremap = true, desc = "Move To Next Tab" }
)
