-- local
local neorg = require("neorg")
neorg.setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          wiki = "~/documents/wiki",
          rd = "~/projects/r+d/wiki",
        },
        autodir = true,
        index = "index.norg",
      },
    },
    ["core.norg.journal"] = {},
  }
}
