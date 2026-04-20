-- Example classes: { [1] = { ["desc"] = 9556,["name"] = 1076,["id"] = 2,} ,[2] = { ["desc"] = 9559,["name"] = 1079,["id"] = 3,} ,[3] = { ["desc"] = 9561,["name"] = 1082,["id"] = 4,} ,[4] = { ["desc"] = 9573,["name"] = 1053,["id"] = 8,} ,[5] = { ["desc"] = 9572,["name"] = 1052,["id"] = 9,} ,}
function populateClass(race)
  if race == %race_index% then
    chargen.class = {
      [1] = { ["desc"] = 9556,["name"] = 1076,["id"] = 2,},
      [2] = { ["desc"] = 9559,["name"] = 1079,["id"] = 3,},
      [3] = { ["desc"] = 9561,["name"] = 1082,["id"] = 4,},
      [4] = { ["desc"] = 9573,["name"] = 1053,["id"] = 8,},
      [5] = { ["desc"] = 9572,["name"] = 1052,["id"] = 9,}
    }
  end
end
