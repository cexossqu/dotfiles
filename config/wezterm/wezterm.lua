local wezterm = require 'wezterm'

return {
  font = wezterm.font 'Symbols Nerd Font',
  -- You can specify some parameters to influence the font selection;
  -- for example, this selects a Bold, Italic font variant.
  font = wezterm.font('JetBrains Mono', { weight = 'Bold', italic = false }),
  hide_tab_bar_if_only_one_tab = true,
  window_background_opacity = 0.80,
}

