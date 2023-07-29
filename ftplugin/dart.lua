local dap = require("dap")

dap.adapters.dart = {
	type = "executable",
	command = "dart",
	-- This command was introduced upstream in https://github.com/dart-lang/sdk/commit/b68ccc9a
	args = { "debug_adapter" },
}
dap.configurations.dart = {
	{
		type = "dart",
		request = "launch",
		name = "Launch Dart Program",
		-- The nvim-dap plugin populates this variable with the filename of the current buffer
		program = "${file}",
		-- The nvim-dap plugin populates this variable with the editor's current working directory
		cwd = "${workspaceFolder}",
		args = { "--help" }, -- Note for Dart apps this is args, for Flutter apps toolArgs
	},
}
