return {
  'NeogitOrg/neogit',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional - Diff integration
    'nvim-telescope/telescope.nvim', -- optional
  },
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Neogit' },
  },
  opts = {
    mappings = {
      popup = {
        ['F'] = 'PullPopup',
        ['p'] = 'PushPopup',
      },
      status = {
        ['gz'] = 'RefreshBuffer',
      },
    },
  },
  cmd = 'Neogit',
  config = function()
    require('neogit').setup {}
    -- Neovim 0.12+ automatically sets $NVIM_LISTEN_ADDRESS on startup.
    -- When Neogit spawns a headless child Neovim as the git editor, the child
    -- inherits this var and tries to bind to the same socket as the parent,
    -- causing "address already in use" and a silent "commit failed" error.
    -- Clearing it here prevents the child from inheriting the parent's socket.
    local client = require 'neogit.client'
    local original = client.get_envs_git_editor
    client.get_envs_git_editor = function(show_diff)
      local env = original(show_diff)
      env.NVIM_LISTEN_ADDRESS = ''
      return env
    end
  end,
}
