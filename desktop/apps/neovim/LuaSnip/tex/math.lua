local in_mathzone = function()
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end

return {

s({trig = '([%a%)%]%}])00', regTrig = true, wordTrig = false, snippetType = "autosnippet"},
  fmta(
    "<>_{<>}",
    {
      f( function(_, snip) return snip.captures[1] end ),
      t("0")
    }
  ) 	
),


s({trig = "ff", snippetType="autosnippet"},
  fmta(
    "\\frac{<>}{<>}",
    {
      i(1),
      i(2),
    }
  ),
  {condition = in_mathzone}  
),
}
