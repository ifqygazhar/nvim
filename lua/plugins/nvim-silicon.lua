return {
  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    main = "nvim-silicon",

    keys = {
      {
        "<leader>Ss",
        function()
          require("nvim-silicon").shoot()
        end,
        desc = "Create code screenshot",
        mode = "v",
      },
      {
        "<leader>Sf",
        function()
          require("nvim-silicon").file()
        end,
        desc = "Save code screenshot as file",

        mode = "v",
      },

      {
        "<leader>Sc",
        function()
          require("nvim-silicon").clip()
        end,
        desc = "Copy code screenshot to clipboard",

        mode = "v",
      },
    },
    opts = {
      -- Configuration here, or leave empty to use defaults
      line_offset = function(args)
        return args.line1
      end,
    },
  },
}
