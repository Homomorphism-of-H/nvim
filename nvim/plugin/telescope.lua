local function load()
    require("telescope").setup()
end

require("lze").load({
    "telescope.nvim",
    event = "VimEnter",
    after = function()
        vim.schedule(load)
    end
})
