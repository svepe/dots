local wk = require("which-key")
wk.register({
    ["<leader>"] = {
        b = { name = require("icons").get("ui").Buffer .. " Buffer" },
        f = { name = require("icons").get("ui").File .. " File" },
        m = {
            name = require("icons").get("misc").Mode .. " Major Mode",
            w = {
                name = "Workspace",
                {
                    -- Add a dummy entry (see bug: https://github.com/folke/which-key.nvim/issues/482)
                    s = { name = "dummy" },
                },
            },
        },
        w = { name = require("icons").get("ui").Window .. " Window" },
        [";"] = { name = require("icons").get("ui").Comment .. " Comment" },
        g = { name = require("icons").get("git").Branch .. " Git" },
        d = { name = require("icons").get("ui").Bug .. " Debug" },
    },
    ["["] = { name = "Previous" },
    ["]"] = { name = "Next" },
    ["s"] = { name = "Surround" },
    ["ga"] = { name = "Arguments" },
    ["C-l"] = { name = "Navigate left" },
})

-- Files
local telescope_builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", telescope_builtin.find_files, { desc = "Find file" })
vim.keymap.set("n", "<leader>fg", telescope_builtin.live_grep, { desc = "Search in files" })
vim.keymap.set("n", "<leader>fr", telescope_builtin.oldfiles, { desc = "Recent files" })
vim.keymap.set({ "n", "v" }, "<leader>fs", vim.cmd.w, { desc = "Save file" })
vim.keymap.set("n", "<leader>fb", ":Telescope file_browser path=%:p:h<CR>", { desc = "File browser" })
vim.keymap.set("n", "<leader>ft", ":Neotree filesystem reveal left<CR>", { desc = "Show filte tree" })

-- Buffers
vim.keymap.set("n", "<leader>bb", telescope_builtin.buffers, { desc = "Find buffer" })
vim.keymap.set("n", "<leader><tab>", require("utils").last_buffer, { desc = "Alternate buffer" })
vim.keymap.set("n", "<leader>bn", function() vim.cmd("bn") end, { desc = "Next buffer" })
vim.keymap.set("n", "<leader>bp", function() vim.cmd("bp") end, { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>bd", ":lua MiniBufremove.delete()<cr>", { silent = true, desc = "Delete buffer" })
vim.keymap.set("n", "<leader>bs", require("utils").scratch_buffer, { desc = "Scratch buffer" })

-- Windows
-- https://gist.github.com/benfrain/97f2b91087121b2d4ba0dcc4202d252f
for i = 1, 9 do
    local lhs = "<leader>" .. i
    local rhs = i .. "<C-W>w"
    vim.keymap.set("n", lhs, rhs, { desc = "which_key_ignore" })
end

vim.keymap.set("n", "<leader>wd", "<C-W>c", { desc = "Close" })
vim.keymap.set("n", "<leader>ws", "<C-W>s", { desc = "Split below" })
vim.keymap.set("n", "<leader>wv", "<C-W>v", { desc = "Split right" })

-- Trouble
vim.keymap.set("n", "<leader>mtl", function() require("trouble").toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>mta", function() require("trouble").toggle("workspace_diagnostics") end)

-- Git
vim.keymap.set(
    { "n", "v" },
    "<leader>gs",
    function() require("neogit").open({ cwd = vim.fn.expand("%:p:h"), kind = "vsplit" }) end,
    { desc = "Git status" }
)

-- General
-- Here is a utility function that closes any floating windows when you press escape
vim.keymap.set("n", "<esc>", function()
    require("utils").close_floating()
    vim.cmd("noh")
end, { desc = "Remove search highlighting" })


-- LSP
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<leader>me', vim.diagnostic.open_float, { desc = "Explain error" })
vim.keymap.set('n', '<leader>mp', vim.diagnostic.goto_prev, { desc = "Previous error" })
vim.keymap.set('n', '<leader>mn', vim.diagnostic.goto_next, { desc = "Next error" })

-- Use LspAttach autocommand to only map the following keys after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = function(desc) return { buffer = ev.buf, desc = desc } end
        vim.keymap.set('n', '<leader>md', telescope_builtin.lsp_definitions, opts("Go to defitnition"))
        vim.keymap.set('n', '<leader>mD', vim.lsp.buf.declaration, opts("Go to declaration"))
        vim.keymap.set('n', '<leader>mI', telescope_builtin.lsp_implementations, opts("Go to implementations"))
        vim.keymap.set('n', '<leader>mT', telescope_builtin.lsp_type_definitions, opts("Go to type definition"))
        vim.keymap.set('n', '<leader>ms', telescope_builtin.lsp_document_symbols, opts("Show symbols"))
        vim.keymap.set('n', '<leader>mr', telescope_builtin.lsp_references, opts("Show references"))
        vim.keymap.set('n', '<leader>ml', telescope_builtin.diagnostics, opts("List issues"))
        vim.keymap.set('n', '<leader>mR', vim.lsp.buf.rename, opts("Rename"))
        vim.keymap.set({ 'n', 'v' }, '<space>ma', vim.lsp.buf.code_action, opts("Show code actions"))
        vim.keymap.set('n', '<leader>mf', function() vim.lsp.buf.format { async = true } end, opts("Format"))
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts("Hover"))
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts("Show signature help"))

        vim.keymap.set('n', '<leader>mws', telescope_builtin.lsp_dynamic_workspace_symbols,
            opts("Show workspace symbols"))
        vim.keymap.set('n', '<leader>mwa', vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
        vim.keymap.set('n', '<leader>mwr', vim.lsp.buf.remove_workspace_folder, opts("Remove workspace folder"))
        vim.keymap.set('n', '<leader>mwl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts("List workspace folders"))
    end,
})

-- DAP
vim.keymap.set('n', '<leader>dc', function() require('dap').continue() end, { desc = "Continue / Start" })
vim.keymap.set('n', '<leader>dx', function() require('dap').terminate() end, { desc = "Terminate" })
vim.keymap.set('n', '<leader>dn', function() require('dap').step_over() end, { desc = "Step over" })
vim.keymap.set('n', '<leader>ds', function() require('dap').step_into() end, { desc = "Step into" })
vim.keymap.set('n', '<leader>dr', function() require('dap').step_out() end, { desc = "Step out" })
vim.keymap.set('n', '<Leader>db', function() require('dap').toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set('n', '<Leader>dB', function() require('dap').set_breakpoint() end, { desc = "Set breakpoint" })
vim.keymap.set('n', '<Leader>dp',
    function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
    { desc = "Set log point" })
vim.keymap.set('n', '<Leader>dR', function() require('dap').repl.open() end, { desc = "Open REPL" })
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "Run last" })
vim.keymap.set({ 'n', 'v' }, '<leader>dh', function()
    require('dap.ui.widgets').hover()
end, { desc = "Hover" })
vim.keymap.set({ 'n', 'v' }, '<leader>dp', function()
    require('dap.ui.widgets').preview()
end, { desc = "Preview" })
vim.keymap.set('n', '<leader>dF', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end, { desc = "Frames" })
vim.keymap.set('n', '<leader>dS', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end, { desc = "Scopes" })
