return {
    "folke/trouble.nvim",
    opts = {
        position = "right",                -- position of the list can be: bottom, top, left, right
        height = 10,                       -- height of the trouble list when position is top or bottom
        width = 80,                        -- width of the list when position is left or right
        mode = "doucment_diagnostics",     -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
    }
}
