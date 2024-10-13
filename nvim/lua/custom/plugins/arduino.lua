return {
  'stevearc/vim-arduino',
  setup = function()
    require('vim-arduino').setup {
      vim.keymap.set('n', '<leader>aa', '<cmd>ArduinoAttach<CR>'),
      vim.keymap.set('n', '<leader>av', '<cmd>ArduinoVerify<CR>'),
      vim.keymap.set('n', '<leader>au', '<cmd>ArduinoUpload<CR>'),
      vim.keymap.set('n', '<leader>as', '<cmd>ArduinoSerial<CR>'),
      vim.keymap.set('n', '<leader>ac', '<cmd>ArduinoChooseBoard<CR>'),
    }
  end,
}
