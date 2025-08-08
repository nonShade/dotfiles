return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
	},

	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				layout_config = {
					prompt_position = "top",
				},
				sorting_strategy = "ascending",
			},
		})

		vim.keymap.set("n", "<leader><space>", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>/", builtin.live_grep, { desc = "Telescope live grep" })
		vim.keymap.set("n", "<leader>bf", builtin.buffers, { desc = "Telescope buffers" })
		vim.keymap.set("n", "<leader>ss", builtin.lsp_document_symbols, { desc = "Telescope symbols (document)" })
	end,
}
