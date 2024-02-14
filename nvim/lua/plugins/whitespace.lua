return {
    -- Remove trailing whitespace
    "echasnovski/mini.trailspace",
    version=false, -- Stay on main branch
    config=function()
        vim.api.nvim_set_hl(0, "MiniTrailspace", { bg="PeachPuff4" })
        require("mini.trailspace").setup()
        vim.api.nvim_create_autocmd({ "BufWritePre" }, {
            pattern = { "*" },
            callback = function()
                require("mini.trailspace").trim()            -- Trim trailing whitespaces
                require("mini.trailspace").trim_last_lines() -- Trim trailing empty lines
            end,
        })
    end,
}
