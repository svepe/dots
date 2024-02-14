return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
        },
        {
            "nvim-telescope/telescope-file-browser.nvim",
        },
    },
    config=function()
        require("telescope").setup({
            extensions = {
                file_browser = {
                    hijack_netrw = true,
                },
            },
        })

        require("telescope").load_extension("fzf")
        require("telescope").load_extension("file_browser")

        -- Files
        local builtin = require("telescope.builtin")
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc="Find file" })
        vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc="Search in files" })
        vim.keymap.set("n", "<leader>fr", builtin.oldfiles, { desc="Recent files" })
        vim.keymap.set({"n", "v"}, "<leader>fs", vim.cmd.w, { desc="Save file" })

        local file_browser = require("telescope").extensions.file_browser
        vim.keymap.set(
            "n",
            "<leader>fb",
            ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
            { desc="File browser" }
        )

        local last_buffer = function()
            for _, buf in ipairs(vim.api.nvim_list_bufs()) do
                -- Switch to alternative buffer only if it was not closed
                if vim.api.nvim_buf_is_loaded(buf) then
                    local name = vim.api.nvim_buf_get_name(buf)
                    if name == vim.fn.expand("#:p") then
                        vim.cmd("b#")
                        return
                    end
                end
            end
            vim.cmd("blast")
        end

        -- Buffers
        vim.keymap.set("n", "<leader>bb", builtin.buffers, { desc="Find buffer" })
        vim.keymap.set("n", "<leader><tab>", last_buffer, { desc="Alternate buffer" })
        vim.keymap.set("n", "<leader>bn", function() vim.cmd("bn") end, { desc="Next buffer" })
        vim.keymap.set("n", "<leader>bp", function() vim.cmd("bp") end, { desc="Previous buffer" })
        vim.keymap.set("n", "<leader>bd", ":lua MiniBufremove.delete()<cr>", { silent = true, desc = "Delete buffer" })
    end
}
