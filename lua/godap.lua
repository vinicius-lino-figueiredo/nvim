local dap, dapui = require('dap'), require('dapui')
local dapgo = require('dap-go')
dapui.setup()
dapgo.setup()
dap.listeners.before.attach.dapui_config = function()
 dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
 dapui.open()
end
require('dap').configurations.go = {
  {
    type = 'delve',
    name = 'Debug',
    request = 'launch',
    program = "${workspaceFolder}/main.go",
    envFile = "${workspaceFolder}/.env",  -- Caminho para o arquivo .env
  },
}

vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>q', function()
require('dap').toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>Q', function() require('dap').set_breakpoint()
end)
vim.keymap.set('n', '<Leader>lp', function()
require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)

vim.keymap.set('n', '<Leader>w', function() dapui.open() end)
vim.keymap.set('n', '<Leader>W', function() dapui.close() end)
