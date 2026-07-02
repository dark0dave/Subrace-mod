-- Example classes: { [1] = { ["desc"] = 9556,["name"] = 1076,["id"] = 2,} ,[2] = { ["desc"] = 9559,["name"] = 1079,["id"] = 3,} ,[3] = { ["desc"] = 9561,["name"] = 1082,["id"] = 4,} ,[4] = { ["desc"] = 9573,["name"] = 1053,["id"] = 8,} ,[5] = { ["desc"] = 9572,["name"] = 1052,["id"] = 9,} ,}
function populateClass(race)
  if race == %race_index% then
    chargen.class = {
      [1] = { ["desc"] = 9556,["name"] = 1076,["id"] = 2,},
      [2] = { ["desc"] = 9559,["name"] = 1079,["id"] = 3,},
      [3] = { ["desc"] = 9561,["name"] = 1082,["id"] = 4,},
    }
    chargen.kit = {
      [1] = { ["id"] = 0,["desc"] = 9556,["name"] = 1076,},
      [2] = { ["id"] = 1,["desc"] = 25201,["name"] = 25179,},
      [3] = { ["id"] = 2,["desc"] = 25203,["name"] = 25180,},
      [4] = { ["id"] = 3,["desc"] = 25204,["name"] = 25181,},
    }
  end
end
