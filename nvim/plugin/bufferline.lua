local function load()
    require("bufferline").setup({

    })
end

require("lze").load({
    "bufferline.nvim",
    event = "VimEnter",
    after = function()
        vim.schedule(load)
    end
})
