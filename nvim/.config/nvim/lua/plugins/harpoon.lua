local plugin = "harpoon"
return {
"theprimeagen/" .. plugin,
  branch = "harpoon2",
  requires = { "nvim-lua/plenary.nvim" },
  config = function()
    require("harpoon").setup()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    --  Harpoon makred files 1 through 4
    vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end, { desc = "Harpoon: Go to marked file 1" })
    vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end, { desc = "Harpoon: Go to marked file 2" })
    vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end, { desc = "Harpoon: Go to marked file 3" })
    vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end, { desc = "Harpoon: Go to marked file 4" })
    --  Harpoon next and previous
    vim.keymap.set("n", "<leader><C-]>", function() ui.nav_next() end, {  desc = "Harpoon: Go to next marked file" })
    vim.keymap.set("n", "<leader><C-[>", function() ui.nav_prev() end, {  desc = "Harpoon: Go to previous marked file" })
    -- Harpoon user interface
    vim.keymap.set("n", "<leader>_", ui.toggle_quick_menu, { desc = "Harpoon: Toggle quick menu" })
    vim.keymap.set("n", "<leader>+", mark.add_file, { desc = "Harpoon: Add file to marked files" })

  end,
}
