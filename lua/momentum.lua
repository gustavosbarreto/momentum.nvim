-- ~/.config/nvim/lua/plugins/repeat_nav.lua
local M = {}

local state = {
    last_key = nil,
    last_time = 0,
    count = 0,
    threshold = 0.4,
    trigger_count = 5
}

local function handle_key(key)
    local now = vim.loop.hrtime() / 1e9
    if state.last_key == key and (now - state.last_time) < state.threshold then
        state.count = state.count + 1
    else
        state.count = 1
    end

    state.last_key = key
    state.last_time = now

    if state.count >= state.trigger_count then
        if key == 'h' then
            vim.api.nvim_feedkeys('b', 'n', false)
        elseif key == 'l' then
            vim.api.nvim_feedkeys('w', 'n', false)
        end
        state.count = 0
        return
    end

    vim.api.nvim_feedkeys(key, 'n', false)
end

function M.setup()
    vim.keymap.set('n', 'h', function() handle_key('h') end, { noremap = true })
    vim.keymap.set('n', 'l', function() handle_key('l') end, { noremap = true })
end

return M
