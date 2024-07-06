return {
  {
    "nvim-neorg/neorg",
    lazy = true,
    dependencies = { "vhyrro/luarocks.nvim" },
    opts = {
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
    },
  },
}
