swap = {
  ['placeholder'] = 2,
  ['selected'] = 0
}
function dump(o)
   if type(o) == 'table' then
      local s = '{'
      for k,v in pairs(o) do
        if type(k) ~= 'number' then k = '"'..k..'"' end
        s = s .. '\n ['..k..'] = ' .. dump(v) .. ','
      end
      return s .. ' \n}'
   else
      return tostring(o)
   end
end
function debugChargen()
  print(dump(chargen))
end
function switch(race)
  if race > 7 then
    createCharScreen:OnRaceSelectButtonClick(swap.placeholder)
    swap.selected = race
  else
    createCharScreen:OnRaceSelectButtonClick(race)
  end
end
function revert(race)
  if race > 7 then
    createCharScreen:OnRaceSelectButtonClick(swap.selected)
  end
end
function getRaceTitle()
  if swap.selected ~= 0 then
    local lower_race = Infinity_FetchString(chargen.races[swap.selected].name)
    local race = lower_race:lower():gsub("^%l", string.upper)
    local result, count = string.gsub(chargen.information, "Race: %w+", "Race: " .. race, 1)
    return result
  else
    return chargen.information
  end
end
