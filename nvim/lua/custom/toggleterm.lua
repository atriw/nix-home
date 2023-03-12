return function(use)
	use({
		"akinsho/toggleterm.nvim",
		config = function()
			require("toggleterm").setup({
				open_mapping = [[<leader>t]],
				insert_mappings = false,
				terminal_mappings = false,
			})
			function _G.set_terminal_keymaps()
				local opts = { buffer = 0 }
				vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
				vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
				vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
				vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
				vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			end

			-- if you only want these mappings for toggle term use term://*toggleterm#* instead
			vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

			if pcall(require, "toggleterm.terminal") then
				local Terminal = require("toggleterm.terminal").Terminal
				local lazygit = Terminal:new({
					cmd = "lazygit",
					dir = "git_dir",
					direction = "float",
					float_opts = {
						border = "double",
					},
					on_open = function(term)
						vim.cmd("startinsert!")
						vim.api.nvim_buf_set_keymap(
							term.bufnr,
							"n",
							"q",
							"<cmd>close<CR>",
							{ noremap = true, silent = true }
						)
					end,
					on_close = function(term)
						vim.cmd("startinsert!")
					end,
				})

				function _G.lazygit_toggle()
					lazygit:toggle()
				end

				vim.api.nvim_set_keymap(
					"n",
					"<leader>g",
					"<cmd>lua lazygit_toggle()<CR>",
					{ desc = "Toggle Lazygit", noremap = true, silent = true }
				)
			end
		end,
	})
end
