vim.api.nvim_set_var('NVIM_APPNAME', 'neovim')
package.path = '.\\lua\\?.lua;.\\lua\\?\\init.lua;' .. package.path

-- Set Custom Environment Varialbes
local real_stdpath = vim.fn.stdpath
vim.fn.stdpath = function(what)
  -- see `:h stdpath` for what `what` can be
  if what == 'config' then
    return os.getenv('XDG_CONFIG_HOME') .. '/neovim'
  else
    if what == 'data' then
      return os.getenv('XDG_DATA_HOME') .. '/neovim-data/site'
    end
    return real_stdpath(what)
  end
end

vim.opt.runtimepath = {
  vim.fn.stdpath 'config',
  vim.fn.stdpath 'data',
  vim.env.VIMRUNTIME,
  vim.fn.stdpath 'config' .. '/after',
  vim.fn.stdpath 'data' .. '/after',
}

require('nightly')

require("config.lazy")

