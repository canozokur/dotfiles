local telescope = require('telescope')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

local function live_grep_from_project_git_root()
	local function is_git_repo()
		vim.fn.system("git rev-parse --is-inside-work-tree")

		return vim.v.shell_error == 0
	end

	local function get_git_root()
		local dot_git_path = vim.fn.finddir(".git", ".;")
		return vim.fn.fnamemodify(dot_git_path, ":h")
	end

	local opts = {}

	if is_git_repo() then
		opts = {
			cwd = get_git_root(),
		}
	end

	require("telescope.builtin").live_grep(opts)
end

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = actions.add_to_qflist + actions.open_qflist,
      },
    },
  },
})

vim.keymap.set('n', '<C-o>', function() builtin.find_files({ hidden = true, file_ignore_patterns = { 'node_modules', '.git/', '.venv' }}) end, {})
vim.keymap.set('n', '<leader>ps', function() live_grep_from_project_git_root() end, {})
