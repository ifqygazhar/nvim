return {
  {

    "akinsho/flutter-tools.nvim",
    lazy = false,
    keys = {
      { "<leader>rs", "<cmd>FlutterDevices<cr>", desc = "Show connected devices" },
      { "<leader>rr", "<cmd>FlutterRun<cr>", desc = "Run the current project" },
      { "<leader>re", "<cmd>FlutterEmulators<cr>", desc = "Show running emulators" },
      { "<leader>rR", "<cmd>FlutterReload<cr>", desc = "Reload the running project" },
      { "<leader>rt", "<cmd>FlutterRestart<cr>", desc = "Restart the current project" },
      { "<leader>rq", "<cmd>FlutterQuit<cr>", desc = "Ends a running session" },
      { "<leader>rl", "<cmd>FlutterLspRestart<cr>", desc = "Restart the dart lsp" },
      { "<leader>rn", "<cmd>FlutterRename<cr>", desc = "Rename classes" },
      { "<leader>rf", "<cmd>FlutterCommands<cr>", desc = "All Flutter commands" },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
    },
    config = function()
      require("flutter-tools").setup({
        -- (uncomment below line for windows only)
        -- flutter_path = "home/flutter/bin/flutter.bat",

        debugger = {
          -- make these two params true to enable debug mode
          enabled = true,
          run_via_dap = true,
          register_configurations = function(_)
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.expand("C:/Users/ifqy/AppData/Local/nvim-data/mason/bin/dart-debug-adapter.cmd"),
              --command = "",
              args = { "flutter" },
              options = {
                detached = false,
              },
            }

            require("dap").configurations.dart = {
              {
                type = "dart",
                request = "launch",
                name = "Launch flutter",
                dartSdkPath = "/Users/mm/.puro/envs/default/flutter/bin/dart",
                flutterSdkPath = "/Users/mm/.puro/envs/default/flutter/bin/flutter",
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
            }
            -- uncomment below line if you've launch.json file already in your vscode setup
            -- require("dap.ext.vscode").load_launchjs()
          end,
        },
        lsp = {
          color = { -- show the derived colours for dart variables
            enabled = true, -- whether or not to highlight color variables at all, only supported on flutter >= 2.10
            background = true, -- highlight the background
            background_color = nil, -- required, when background is transparent (i.e. background_color = { r = 19, g = 17, b = 24},)
            foreground = false, -- highlight the foreground
            virtual_text = true, -- show the highlight using virtual text
            virtual_text_str = "■", -- the virtual text character to highlight
          },
        },
        -- widget_guides = {
        --   enabled = true,
        -- },
        -- closing_tags = {
        --   highlight = "ErrorMsg", -- highlight for the closing tag
        --   prefix = ">", -- character to use for close tag e.g. > Widget
        --   enabled = true, -- set to false to disable
        -- },
        dev_log = {
          -- toggle it when you run without DAP
          enabled = true,
          notify_errors = true,
          open_cmd = "tabedit",
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt", -- "always"
          enableSnippets = true,
          updateImportsOnRename = true, -- Whether to update imports and other directives when files are renamed. Required for `FlutterRename` command.
        },
        -- settings = {
        --   analysisExcludedFolders = {
        --     vim.fn.expand("/home/sifat/.pub-cache"),
        --     vim.fn.expand("/home/sifat/flutter"),
        --   },
        -- },
      })
    end,
  },
}
