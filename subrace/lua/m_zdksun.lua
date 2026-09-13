-- Example classes: { [1] = { ["desc"] = 9556,["name"] = 1076,["id"] = 2,} ,[2] = { ["desc"] = 9559,["name"] = 1079,["id"] = 3,} ,[3] = { ["desc"] = 9561,["name"] = 1082,["id"] = 4,} ,[4] = { ["desc"] = 9573,["name"] = 1053,["id"] = 8,} ,[5] = { ["desc"] = 9572,["name"] = 1052,["id"] = 9,} ,}
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
function theOldSwitchAroooooo(race)
  if race == %race_index% then
    createCharScreen:OnRaceSelectButtonClick(swap.placeholder)
  else
    createCharScreen:OnRaceSelectButtonClick(race)
  end
  swap.selected = race
end
function getRaceTitle()
  if swap.selected ~= 0 then
    print(dump(chargen.races[swap.selected]))
    return Infinity_FetchString(chargen.races[swap.selected].name)
  else
    return getUiString("RACE_TITLE")
  end
end

