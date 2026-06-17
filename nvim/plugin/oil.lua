local function load()
    require("oil").setup({
        delete_to_trash = true,
        default_file_explorer = false,
    })
end

require("lze").load({
    "oil.nvim",
    event = "VimEnter",
    after = function()
        vim.schedule(load)
    end
})
