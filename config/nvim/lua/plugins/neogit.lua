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
  cmd = 'Neogit',
  config = function()
    require('neogit').setup {
      mappings = {
        popup = {
          ['F'] = 'PullPopup',
          ['p'] = 'PushPopup',
          ['P'] = false,
        },
        status = {
          ['gz'] = 'RefreshBuffer',
        },
      },
    }

    -- Neovim sets $NVIM_LISTEN_ADDRESS on startup. When Neogit spawns a
    -- headless child nvim as the git editor, the child inherits this and
    -- tries to bind to the same socket as the parent, causing "address
    -- already in use" and a silent "commit failed". Clearing it here fixes this.
    local client = require 'neogit.client'
    local original = client.get_envs_git_editor
    client.get_envs_git_editor = function(show_diff)
      local env = original(show_diff)
      env.NVIM_LISTEN_ADDRESS = ''
      return env
    end
  end,
}
