return {

    "theprimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon"):setup()
    end,
    keys = {
      -- { "<leader>A", function() require("harpoon"):list():append() end, desc = "harpoon file", },
      -- { "<leader>a", function() local harpoon = require("harpoon") harpoon.ui:toggle_quick_menu(harpoon:list()) end, desc = "harpoon quick menu", },
      -- { "<leader>1", function() require("harpoon"):list():select(1) end, desc = "harpoon to file 1", },
      -- { "<leader>2", function() require("harpoon"):list():select(2) end, desc = "harpoon to file 2", },
      -- { "<leader>3", function() require("harpoon"):list():select(3) end, desc = "harpoon to file 3", },
      -- { "<leader>4", function() require("harpoon"):list():select(4) end, desc = "harpoon to file 4", },
      -- { "<leader>5", function() require("harpoon"):list():select(5) end, desc = "harpoon to file 5", },
      --  Harpoon makred files 1 through 4
      {"<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon: Go to marked file 1"},
      {"<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon: Go to marked file 2"},
      {"<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon: Go to marked file 3"},
      {"<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon: Go to marked file 4"},
      --  Harpoon next and previous
      {"<leader><C-]>", function() require("harpoon"):list():next() end,  desc = "Harpoon: Go to next marked file"},
      {"<leader><C-[>", function() require("harpoon"):list():prev() end,  desc = "Harpoon: Go to previous marked file"},
      -- Harpoon user interface
      {"<leader>_", function() require("harpoon").ui:toggle_quick_menu(harpoon:list()) end, desc = "Harpoon: Toggle quick menu"},
      {"<leader>+", function() require("harpoon");list():append() end, desc = "Harpoon: Add file to marked files"},

    },
}

-- return {
--   "theprimeagen/harpoon",
--   branch = "harpoon2",
--   dependencies = { "nvim-lua/plenary.nvim" },
--   config = function()
--     --     require("harpoon").setup()
--     --     local mark = require("harpoon.mark")
--     --     local ui = require("harpoon.ui")
--     --
--     --     --  Harpoon makred files 1 through 4
--     --     vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon: Go to marked file 1" })
--     --     vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Harpoon: Go to marked file 2" })
--     --     vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Harpoon: Go to marked file 3" })
--     --     vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Harpoon: Go to marked file 4" })
--     --     --  Harpoon next and previous
--     --     vim.keymap.set("n", "<leader><C-]>", function() ui.nav_next() end, {  desc = "Harpoon: Go to next marked file" })
--     --     vim.keymap.set("n", "<leader><C-[>", function() ui.nav_prev() end, {  desc = "Harpoon: Go to previous marked file" })
--     --     -- Harpoon user interface
--     --     vim.keymap.set("n", "<leader>_", ui.toggle_quick_menu, { desc = "Harpoon: Toggle quick menu" })
--     --     vim.keymap.set("n", "<leader>+", mark.add_file, { desc = "Harpoon: Add file to marked files" })
--     --
--     --   end,
--     --
--     local harpoon = require("harpoon")
--     -- REQUIRED
--     harpoon:setup()
--     -- REQUIREd
--
--   end,
--   keys = {
--       --  Harpoon makred files 1 through 4
--       {"<leader>1", function() require("harpoon"):list():select(1) end, desc = "Harpoon: Go to marked file 1"},
--       {"<leader>2", function() require("harpoon"):list():select(2) end, desc = "Harpoon: Go to marked file 2"},
--       {"<leader>3", function() require("harpoon"):list():select(3) end, desc = "Harpoon: Go to marked file 3"},
--       {"<leader>4", function() require("harpoon"):list():select(4) end, desc = "Harpoon: Go to marked file 4"},
--       --  Harpoon next and previous
--       {"<leader><C-]>", function() require("harpoon"):list():next() end,  desc = "Harpoon: Go to next marked file"},
--       {"<leader><C-[>", function() require("harpoon"):list():prev() end,  desc = "Harpoon: Go to previous marked file"},
--       -- Harpoon user interface
--       {"<leader>_", require("harpoon").ui:toggle_quick_menu(harpoon:list()), desc = "Harpoon: Toggle quick menu"},
--       {"<leader>+", mark.add_file, desc = "Harpoon: Add file to marked files"},
--
--   }
-- } 

