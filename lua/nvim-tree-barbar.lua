local view = require "nvim-tree.view"

local tree = {}
tree.toggle = function()
    if view.is_visible() then
        require "bufferline.api".set_offset(0)
    else
        require "bufferline.api".set_offset(31, "FileTree")
    end
    require "nvim-tree".toggle(true)
end

tree.open = function()
    require "bufferline.api".set_offset(31, "FileTree")
    require "nvim-tree".find_file(true)
end

tree.close = function()
    view.close()
    require "bufferline.api".set_offset(0)
end

return tree
