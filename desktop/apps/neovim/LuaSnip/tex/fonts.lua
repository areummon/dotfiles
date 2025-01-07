package.path = package.path .. ";/home/moka/nixos-config/desktop/apps/neovim/LuaSnip/?.lua"
local helpers = require("luasnip-helper-funcs")
local get_visual = helpers.get_visual

return {
s({trig = "tii", dscr = "Expands 'tii' into LaTeX's textit{} command."},
  fmta("\\textit{<>}",
    {
      d(1, get_visual),
    }
  )
),

s({trig = "([^%a])mm", wordTrig = false, regTrig = true, snippetType="autosnippet"},
  fmta(
    "<>$<>$",
    {
      f( function(_, snip) return snip.captures[1] end ),
      d(1, get_visual),
    }
  )
),
}
