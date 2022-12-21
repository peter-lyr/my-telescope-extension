-- 和autoload\telescope_extension.vim
-- 一样不要改了

local status, telescope = pcall(require, "telescope")
if not status then
  return
end

local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"
local finders = require "telescope.finders"
local pickers = require "telescope.pickers"
local conf = require("telescope.config").values


local function my_telescope_extension(opts)
  local content = vim.g.my_telescope_extension_input_list

  pickers.new(opts, {
    prompt_title = vim.g.my_telescope_extension_prompt_title,
    finder = finders.new_table {
      results = content,
      entry_maker = opts.entry_maker,
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr)
      actions.select_default:replace(function()
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        vim.call('telescope_extension#callback', selection.value)
      end)
      return true
    end,
  }):find()
end

return telescope.register_extension({
  exports = {
    my_telescope_extension = my_telescope_extension,
  },
})
