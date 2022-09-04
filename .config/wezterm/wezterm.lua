local wezterm = require 'wezterm'

return {
  term = 'wezterm',
  use_ime = true,
  font_size = 16,
  font = wezterm.font_with_fallback { "FiraCode Nerd Font Mono", "Noto Sans Mono CJK JP" },
  font_rules = {
    {
      intensity = "Bold",
      font = wezterm.font("FiraCode Nerd Font Mono", {weight="Bold", stretch="Normal", style="Normal"})
    },
    {
      italic = true,
      font = wezterm.font("Hack Nerd Font Mono", {weight="Regular", stretch="Normal", style="Normal", italic=true})
    },
    {
      italic = true,
      intensity = "Bold",
      font = wezterm.font("Hack Nerd Font Mono", {weight="Bold", stretch="Normal", style="Normal", italic=true})
    },
  },
  color_scheme = 'tokyonight-day',
  force_reverse_video_cursor = true,
  line_height = 1.1,
  hide_tab_bar_if_only_one_tab = true,
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  adjust_window_size_when_changing_font_size = false,
  skip_close_confirmation_for_processes_named = {},
  leader = { key = 'b', mods = 'CTRL', timeout_milliseconds = 1000 },
  keys = {
    {
      key = 'r',
      mods = 'LEADER',
      action = wezterm.action.ReloadConfiguration,
    },
    {
      key = 'c',
      mods = 'LEADER',
      action = wezterm.action.SpawnCommandInNewTab { cwd="$HOME" },
    },
    {
      key = '-',
      mods = 'LEADER',
      action = wezterm.action.SplitVertical,
    },
    {
      key = '|',
      mods = 'LEADER',
      action = wezterm.action.SplitHorizontal,
    },
    {
      key = 'h',
      mods = 'LEADER',
      action = wezterm.action.ActivatePaneDirection 'Left',
    },
    {
      key = 'l',
      mods = 'LEADER',
      action = wezterm.action.ActivatePaneDirection 'Right',
    },
    {
      key = 'k',
      mods = 'LEADER',
      action = wezterm.action.ActivatePaneDirection 'Up',
    },
    {
      key = 'j',
      mods = 'LEADER',
      action = wezterm.action.ActivatePaneDirection 'Down',
    },
    {
      key = 'H',
      mods = 'LEADER',
      action = wezterm.action.AdjustPaneSize { 'Left', 5 },
    },
    {
      key = 'J',
      mods = 'LEADER',
      action = wezterm.action.AdjustPaneSize { 'Down', 5 },
    },
    {
      key = 'K',
      mods = 'LEADER',
      action = wezterm.action.AdjustPaneSize { 'Up', 5 }
    },
    {
      key = 'L',
      mods = 'LEADER',
      action = wezterm.action.AdjustPaneSize { 'Right', 5 },
    },
    {
      key = 'x',
      mods = 'LEADER',
      action = wezterm.action.CloseCurrentPane { confirm = true },
    },
    {
      key = 'w',
      mods = 'LEADER',
      action = wezterm.action.ShowTabNavigator,
    },
    {
      key = 'n',
      mods = 'LEADER',
      action = wezterm.action.ActivateTabRelative(1),
    },
    {
      key = 'p',
      mods = 'LEADER',
      action = wezterm.action.ActivateTabRelative(-1),
    },
    {
      key = '[',
      mods = 'LEADER',
      action = wezterm.action.ActivateCopyMode
    }
  },
  window_decorations = "RESIZE",
  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  }
}
