local function load()
    require("blink.cmp").setup()
end

require('lze').load({
    "blink.cmp",
    event = "VimEnter",
    before = function()
        vim.schedule(load)
    end
})
