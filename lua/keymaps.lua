-- telescope
vim.keymap.set("n", "<S-o>", "<Cmd>NvimTreeFocus<CR>", { noremap = true, desc = "Open File Tree" })
vim.keymap.set("n", "<A-t>", "<Cmd>Telescope<CR>", { noremap = true, desc = "Launch Telescope" })
vim.keymap.set("n", "<A-o>", "<Cmd>Telescope oldfiles<CR>", { noremap = true, desc = "Open Recent Files" })
vim.keymap.set("n", "<A-p>", "<Cmd>CdProject<CR>", { noremap = true, desc = "Open Recent Files" })

-- utility
vim.keymap.set("n", "<C-`>", "<Cmd>terminal<CR>", { noremap = true, desc = "Open Terminal" })
vim.keymap.set({ "n", "i" }, "<C-s>", "<Cmd>w<CR>", { noremap = true, desc = "Save File" })

-- navigation
vim.keymap.set({ "n", "i", "v", "c" }, "<C-Home>", "<Cmd>bp<CR>", { noremap = true, desc = "Move To Next Buffer" })
vim.keymap.set({ "n", "i", "v", "c" }, "<C-End>", "<Cmd>bn<CR>", { noremap = true, desc = "Move To Previous Buffer" })

vim.keymap.set({ "n", "i", "v", "c" }, "<C-PageUp>", "<Cmd>tabp<CR>", { noremap = true, desc = "Move To Prev Window" })
vim.keymap.set(
	{ "n", "i", "v", "c" },
	"<C-PageDown>",
	"<Cmd>tabn<CR>",
	{ noremap = true, desc = "Move To Next Window" }
)
