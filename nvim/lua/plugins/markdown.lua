return {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    config=function()
        vim.cmd(
        [[
            function OpenMarkdownPreview (url)
              execute "silent ! firefox --new-window " . a:url
            endfunction
        ]]
        )
        vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
    end
}
