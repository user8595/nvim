vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.number = true
vim.opt.ruler = true
-- vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true
vim.opt.scrolloff = 8
vim.opt.shortmess = "IltToOCF"
vim.opt.showmode = false
vim.opt.linespace = 2
vim.opt.scrolloff = 5

vim.opt.fillchars = { eob = " " }

if vim.fn.has('win64') == 1 or vim.fn.has('win32') == 1 then
  vim.opt.shell = "C:/Program Files/Git/bin/bash.exe"
  vim.opt.shellquote = "\""
  vim.opt.shellxquote = "\""
  vim.opt.shellcmdflag = "-s"
end

vim.diagnostic.config({
  underline = false,
  signs = {
    active = true,
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN]  = "",
      [vim.diagnostic.severity.HINT]  = "󰟃",
      [vim.diagnostic.severity.INFO]  = "",
    },
  },
  virtual_text = false,
  float = {
    border = "single",
    format = function(diagnostic)
      return string.format(
        "%s (%s) [%s]",
        diagnostic.message,
        diagnostic.source,
        diagnostic.code or diagnostic.user_data.lsp.code
      )
    end,
  },
})

vim.o.guifont = "FiraCode Nerd Font:h13"
vim.g.neovide_title_background_color =
    string.format("%x", vim.api.nvim_get_hl(0, { id = vim.api.nvim_get_hl_id_by_name("Normal") }).bg)

vim.g.neovide_progress_bar_enabled = true
vim.g.neovide_progress_bar_height = 5.0
vim.g.neovide_progress_bar_animation_speed = 200.0
vim.g.neovide_progress_bar_hide_delay = 0.2

vim.g.neovide_scroll_animation_length = 0.22222222225

vim.g.neovide_cursor_vfx_mode = "pixiedust"

-- plugins
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

require("lazy").setup({
  spec = {
    require("plugins"),
    require("dap"),
    require("conform-f"),
    require("cmp-lsp"),
    require("snip-lsnip"),
  },
  install = { colorscheme = { "catppuccin" } },
  checker = { enabled = true },
})

-- colourscheme

vim.cmd.colorscheme("catppuccin")

require("keymaps")

-- plugin setup

require("catppuccin").setup({
  flavour = "mocha",
})

vim.notify = require("notify")
