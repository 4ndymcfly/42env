-- Definir variables globales
vim.g.user = "USERHEADER"
vim.g.mail = "MAILHEADER"

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- add LazyVim and import its plugins
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    -- import/override with your plugins
    { import = "plugins" },
    -- plugin 42 Header
    {
      "Diogo-ss/42-header.nvim",
      cmd = { "Stdheader" },
      keys = { "<F1>" },
      opts = {
        default_map = true, -- Default mapping <F1> in normal mode.
        auto_update = true, -- Update header when saving.
        user = vim.g.user , -- Your user.
        mail = vim.g.mail , -- Your mail.
        -- add other options.
      },
      config = function(_, opts)
        require("42header").setup(opts)
      end,
    },
    -- plugin 42 Formatter
    {
        dir = "~/.config/nvim/lua/plugins/",
        -- Cargar automáticamente en los archivos de C/C++
        ft = { "c", "cpp" },
        -- Opcional: Configuración adicional si es necesario
        config = function()
            vim.cmd("source ~/.config/nvim/lua/plugins/c_formatter_42.vim")
        end,
    },

  },
  defaults = {
    -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
    -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
    lazy = false,
    -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
    -- have outdated releases, which may break your Neovim install.
    version = false, -- always use the latest git commit
    -- version = "*", -- try installing the latest stable version for plugins that support semver
  },
  install = { colorscheme = { "tokyonight", "habamax" } },
  checker = {
    enabled = true, -- check for plugin updates periodically
    notify = false, -- notify on update
  }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Configuración para el corrector ortográfico
local function set_spell_lang()
  local ft = vim.bo.filetype
  if ft == 'markdown' or ft == 'text' then
    vim.opt.spelllang = 'es'
  elseif ft == 'python' or ft == 'html' then
    vim.opt.spelllang = 'en'
  else
    vim.opt.spelllang = 'en'  -- Idioma predeterminado
  end
end

-- Autocmd para aplicar la configuración del corrector ortográfico
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  pattern = '*',
  callback = set_spell_lang,
})

-- Habilitar el corrector ortográfico
vim.opt.spell = true