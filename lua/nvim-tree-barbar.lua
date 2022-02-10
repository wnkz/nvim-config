local view = require "nvim-tree.view"

local tree = {}
tree.toggle_tree = function()
  if view.win_open() then
    require "nvim-tree.view".close()
    require "bufferline.state".set_offset(0)
  else
    require "bufferline.state".set_offset(31, "FileTree")
    require "nvim-tree".find_file(true)
  end
end

tree.open = function()
  require "bufferline.state".set_offset(31, "FileTree")
  require "nvim-tree".find_file(true)
end

tree.close = function()
  require "bufferline.state".set_offset(0)
  require "nvim-tree.view".close()
end

return tree
