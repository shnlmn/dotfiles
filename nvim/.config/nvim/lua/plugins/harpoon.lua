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
    vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
    vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
    vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
    vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)
  
    --  Harpoon next and previous
    vim.keymap.set("n", "<leader><C-]>", function() ui.nav_next() end)
    vim.keymap.set("n", "<leader><C-[>", function() ui.nav_prev() end)

    -- Harpoon user interface
    vim.keymap.set("n", "<leader>_", ui.toggle_quick_menu)
    vim.keymap.set("n", "<leader>+", mark.add_file)

  end,
}
