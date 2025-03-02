# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

# installation

## Linux

```
git clone https://github.com/ifqygazhar/nvim.git ~/.config/nvim
```

## Windows

```
git clone https://github.com/ifqygazhar/nvim.git "$env:LOCALAPPDATA\nvim"
```

# Uninstall

```
# Linux / Macos (unix)
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

# Windows CMD
rd -r ~\AppData\Local\nvim
rd -r ~\AppData\Local\nvim-data

# Window PowerShell
rm -Force ~\AppData\Local\nvim
rm -Force ~\AppData\Local\nvim-data
```

# Some need change for running flutter

Open file on `lua/plugins/flutter_tools.lua` need change location of dart-debug-adapter and SDK flutter location

```
 register_configurations = function(_)
            require("dap").adapters.dart = {
              type = "executable",
              command = vim.fn.expand("C:/Users/ifqy/AppData/Local/nvim-data/mason/bin/dart-debug-adapter.cmd"), #HERE CHANGE
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
                dartSdkPath = "C:/Users/ifqy/fvm/default/bin/cache/dart-sdk/bin", # HERE CHANGE
                flutterSdkPath = "C:/Users/ifqy/fvm/default/bin/flutter", #HERE CHANGE
                program = "${workspaceFolder}/lib/main.dart",
                cwd = "${workspaceFolder}",
              },
            }

```

# Need change for spesific operating system

Open file on `lua/config/keymaps.lua` just comment and uncomment the keymaps you want to use

```

-- For MacOS
map("n", "n", "nzzzv") -- perbaikan dari <n> menjadi n
map("n", "N", "Nzzzv") -- perbaikan dari <N> menjadi N
-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
vim.keymap.set("n", "zR", require("ufo").openAllFolds)
vim.keymap.set("n", "zM", require("ufo").closeAllFolds)

-- Comment keymaps for macOS support
-- macOS menggunakan Command+/ untuk comment
vim.keymap.set("n", "<M-/>", function()
  require("Comment.api").toggle.linewise.current()
end, { noremap = true, silent = true })
vim.keymap.set("x", "<M-/>", function()
  local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
  vim.api.nvim_feedkeys(esc, "nx", false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { noremap = true, silent = true })

-- For General Operating System
-- map("n", "<n>", "nzzzv")
-- map("n", "<N>", "Nzzzv")
-- -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
-- vim.keymap.set("n", "zR", require("ufo").openAllFolds)
-- vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
-- vim.keymap.set("n", "<C-_>", function()
--   require("Comment.api").toggle.linewise.current()
-- end, { noremap = true, silent = true })
-- vim.keymap.set("x", "<C-_>", function()
--   local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
--   vim.api.nvim_feedkeys(esc, "nx", false)
--   require("Comment.api").toggle.linewise(vim.fn.visualmode())
-- end, { noremap = true, silent = true })
```
