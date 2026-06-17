local function load()
    require("direnv").setup({})
end

require('lze').load(
    {
        "direnv.nvim",
        event = "VimEnter",
        after = function()
            vim.schedule(load)
        end
    }
)
