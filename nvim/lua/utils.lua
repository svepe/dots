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

local scratch_buffer = function()
    for _, buf in ipairs(vim.api.nvim_list_bufs()) do
      -- Switch to alternative buffer only if it was not closed
      local name = vim.api.nvim_buf_get_name(buf)
      if name == "/tmp/scratch" then
        vim.api.nvim_win_set_buf(0, buf)
        return
      end
    end

    local buf = vim.api.nvim_create_buf(true, true)
    vim.api.nvim_buf_set_name(buf, "/tmp/scratch")
    vim.cmd("b"..buf)
end

local function close_floating()
    for _, win in pairs(vim.api.nvim_list_wins()) do
        if vim.api.nvim_win_get_config(win).relative == "win" then
            vim.api.nvim_win_close(win, false)
        end
    end
end

return { last_buffer = last_buffer, scratch_buffer = scratch_buffer, close_floating = close_floating }
