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
