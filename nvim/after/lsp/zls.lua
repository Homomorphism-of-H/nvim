---@type vim.lsp.Config
return {
    cmd = { "zls" },

    filetypes = { "zig" },

    root_markers = {
        ".git",
        "build.zig"
    },
}
