return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  lazy = true,
  ft = 'markdown',
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    workspaces = {
      {
        name = 'student',
        path = '~/vaults/student',
      },
      {
        name = 'faculty',
        path = '~/vaults/faculty',
      },
      {
        name = 'personal',
        path = '~/vaults/personal',
      },
    },
    picker = {
      name = 'snacks.pick',
    },
    completion = {
      nvim_cmp = false,
      blink = true,
    },
  },
  keys = {
    { '<leader>ow', '<cmd>Obsidian workspace<cr>', desc = 'S[w]ap Workspace' },
    { '<leader>op', '<cmd>Obsidian quick_switch<cr>', desc = '[P]ick Note' },
    { '<leader>on', '<cmd>Obsidian new<cr>', desc = '[N]ew Note' },
    { '<leader>of', '<cmd>Obsidian follow_link vsplit<cr>', desc = '[F]ollow Link' },
    { '<leader>ol', '<cmd>Obsidian links<cr>', desc = '[L]inks' },
    { '<leader>oi', '<cmd>Obsidian paste_img<cr>', desc = '[P]aste Image' },
    { '<leader>or', '<cmd>Obsidian rename<cr>', desc = '[R]ename note' },
    { '<leader>oc', '<cmd>Obsidian toc<cr>', desc = '[T]able [O]f [C]ontents' },
    { '<leader>os', '<cmd>Obsidian search<cr>', desc = '[S]earch in Notes' },
  },
}
