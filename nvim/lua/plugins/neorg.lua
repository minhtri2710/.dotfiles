return {
  {
    "nvim-neorg/neorg",
    lazy = true,
    dependencies = { "vhyrro/luarocks.nvim" },
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
