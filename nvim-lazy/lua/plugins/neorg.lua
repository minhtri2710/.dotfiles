return {
  {
    "nvim-neorg/neorg",
    lazy = true,
    run = ":Neorg sync-parsers", -- This is the important bit!
    config = function()
      require("neorg").setup({
        load = {
          ["core.defaults"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                work = "~/notes/work",
                home = "~/notes/home",
              },
            },
          },
        },
      })
    end,
  },
}
