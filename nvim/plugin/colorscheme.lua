require('lze').load({
    "trigger_colorscheme",
    event = "VimEnter",
    before = function()
        vim.cmd.colorscheme("moonfly")
    end
})
