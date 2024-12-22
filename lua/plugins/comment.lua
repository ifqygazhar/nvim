return {
  {
    "numToStr/Comment.nvim",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring", -- Plugin tambahan untuk JSX/TSX
    },
    opts = {
      pre_hook = function(ctx)
        local U = require("Comment.utils")

        -- Mendukung JSX/TSX dengan ts_context_commentstring
        if vim.bo.filetype == "typescriptreact" or vim.bo.filetype == "javascriptreact" then
          local ts_utils = require("ts_context_commentstring.utils")
          local location = nil

          if ctx.ctype == U.ctype.block then
            location = ts_utils.get_cursor_location()
          elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
            location = ts_utils.get_visual_start_location()
          end

          return require("ts_context_commentstring.internal").calculate_commentstring({
            key = ctx.ctype == U.ctype.line and "__default" or "__multiline",
            location = location,
          })
        end
      end,
    },
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring", -- Plugin Treesitter untuk mendukung komentar JSX/TSX
    opts = {
      enable = true,
    },
  },
}

