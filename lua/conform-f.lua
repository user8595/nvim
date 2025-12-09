return {
	"stevearc/conform.nvim",
	event = { "BufWritePre", "BufNewFile" },
	config = function()
		require("conform").setup({
			format_on_save = {
				lsp_fallback = true,
				async = false,
			},
		})
	end,
}
