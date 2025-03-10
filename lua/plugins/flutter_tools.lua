return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    keys = {
      { "<leader>rs", "<cmd>FlutterDevices<cr>", desc = "Show connected devices" },
      { "<leader>rr", "<cmd>FlutterRun<cr>", desc = "Run the current project" },
      -- Tambahkan keybinding baru untuk run tanpa debugging
      { "<leader>rn", "<cmd>FlutterRun --no-debug<cr>", desc = "Run without debugging" },
      { "<leader>re", "<cmd>FlutterEmulators<cr>", desc = "Show running emulators" },
      { "<leader>rR", "<cmd>FlutterReload<cr>", desc = "Reload the running project" },
      { "<leader>rt", "<cmd>FlutterRestart<cr>", desc = "Restart the current project" },
      { "<leader>rq", "<cmd>FlutterQuit<cr>", desc = "Ends a running session" },
      { "<leader>rl", "<cmd>FlutterLspRestart<cr>", desc = "Restart the dart lsp" },
      -- Ubah keybinding rn menjadi rc karena rn sudah digunakan di atas
      { "<leader>rc", "<cmd>FlutterRename<cr>", desc = "Rename classes" },
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
          -- Ubah enabled menjadi false untuk menonaktifkan debugger secara default
          enabled = false,
          run_via_dap = false,
          register_configurations = function(_)
            -- Konfigurasi DAP tetap ada untuk ketika Anda ingin menggunakan debugging
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.expand("~/.local/share/nvim/mason/bin/dart-debug-adapter"),
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
          end,
        },
        -- Tambahkan konfigurasi untuk flutter run
        flutter = {
          -- Argumen default untuk perintah run
          default_run_args = { "--no-debug" },
        },
        dev_log = {
          -- Pastikan dev_log tetap enabled
          enabled = true,
          notify_errors = true,
          open_cmd = "tabedit",
        },
        -- Bagian konfigurasi lainnya tetap sama
        lsp = {
          color = {
            enabled = true,
            background = true,
            background_color = nil,
            foreground = false,
            virtual_text = true,
            virtual_text_str = "■",
          },
        },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
          renameFilesWithClasses = "prompt",
          enableSnippets = true,
          updateImportsOnRename = true,
        },
      })
    end,
  },
}
