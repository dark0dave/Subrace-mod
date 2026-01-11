zZsubrTitleTable = {
	['%Ztext_aasimar%'] = {1, %aasimar_desc%},
	['%Ztext_tiefling%'] = {2, %tiefling_desc%},
	['%Ztext_drow%'] = {3, %drow_desc%},
	['%Ztext_wild_elf%'] = {4, %wild_elf_desc%},
	['%Ztext_dwfgold%'] = {5, %dwfgold_desc%},
	['%Ztext_dwfduerg%'] = {6, %dwfduerg_desc%},
	['%Ztext_hflstrong%'] = {7, %hflstrong_desc%},
	['%Ztext_hflhide%'] = {8, %hflhide_desc%},
	['%Ztext_svirfn%'] = {9, %svirfn_desc%},
	['%Ztext_moon_elf%'] = {11, %moon_elf_desc%},
	['%Ztext_feyri%'] = {12, %feyri_desc%},
	['%Ztext_halfdrow%'] = {13, %halfdrow_desc%},
	['%Ztext_air_genasi%'] = {14, %air_genasi_desc%},
	['%Ztext_earth_genasi%'] = {15, %earth_genasi_desc%},
	['%Ztext_fire_genasi%'] = {16, %fire_genasi_desc%},
	['%Ztext_water_genasi%'] = {17, %water_genasi_desc%},
	['%Ztext_halfgrayorc%'] = {18, %halfgrayorc_desc%},
	['%Ztext_sun_elf%'] = {19, %sun_elf_desc%},
	['%Ztext_wood_elf%'] = {20, %wood_elf_desc%},
}

function subt(chr)
	if (chr == 1)  then return Infinity_FetchString(%aasimar_title%) --subrStrings.AASIMAR
	elseif (chr == 2)  then return Infinity_FetchString(%tiefling_title%) --subrStrings.TIEFLING
	elseif (chr == 3)  then return Infinity_FetchString(%drow_title%) --subrStrings.DROW
	elseif (chr == 4)  then return Infinity_FetchString(%wild_elf_title%) --subrStrings.WILD_ELF
	elseif (chr == 5)  then return Infinity_FetchString(%dwfgold_title%) --subrStrings.DWARF_GOLD
	elseif (chr == 6)  then return Infinity_FetchString(%dwfduerg_title%) --subrStrings.DWARF_GRAY
	elseif (chr == 7)  then return Infinity_FetchString(%hflstrong_title%) --subrStrings.HALFLING_STRONGHEART
	elseif (chr == 8)  then return Infinity_FetchString(%hflhide_title%) --subrStrings.HALFLING_GHOSTWISE
	elseif (chr == 9)  then return Infinity_FetchString(%svirfn_title%) --subrStrings.GNOME_DEEP
	elseif (chr == 11) then return Infinity_FetchString(%moon_elf_title%) --subrStrings.MOON_ELF
	elseif (chr == 12) then return Infinity_FetchString(%feyri_title%) --subrStrings.FEYRI
	elseif (chr == 13) then return Infinity_FetchString(%halfdrow_title%) --subrStrings.HALF_DROW
	elseif (chr == 14) then return Infinity_FetchString(%air_genasi_title%) --subrStrings.AIR_GENASI
	elseif (chr == 15) then return Infinity_FetchString(%earth_genasi_title%) --subrStrings.EARTH_GENASI
	elseif (chr == 16) then return Infinity_FetchString(%fire_genasi_title%) --subrStrings.FIRE_GENASI
	elseif (chr == 17) then return Infinity_FetchString(%water_genasi_title%) --subrStrings.WATER_GENASI
	elseif (chr == 18) then return Infinity_FetchString(%halfgrayorc_title%) --subrStrings.HALF_GRAY_ORC
	elseif (chr == 19) then return Infinity_FetchString(%sun_elf_title%) --subrStrings.SUN_ELF
	elseif (chr == 20) then return Infinity_FetchString(%wood_elf_title%) --subrStrings.WOOD_ELF
	else return ""
	end
end

function getSubraceTitleButton(currS)
	if subt(currS) ~= "" then
		return subt(currS)
	else
		return Infinity_FetchString(%select_subrace%)
	end
end

currSubrace = 10
currRace = 0
getSubrace = 0
sbSubraceData = {}
srText = ""


function zzSubraceString(char)
	local rstr = Infinity_FetchString(char.race)
	if srText == "" or char.PC ~= 1 then
		return rstr
	else
		return rstr .. " ( " .. srText .. " )"
	end
end

function createSubraceTable(race)
	sbSubraceData = {}
	if race == 1 then --human
		sbSubraceData = {
			{%Zhuman_title%, %bghuman%, 10},
			{%Zaasimar_title%, %aasimar_desc%, 1},
			{%Ztiefling_title%, %tiefling_desc%, 2},
			{%Zair_genasi_title%, %air_genasi_desc%, 14},
			{%Zearth_genasi_title%, %earth_genasi_desc%, 15},
			{%Zfire_genasi_title%, %fire_genasi_desc%, 16},
			{%Zwater_genasi_title%, %water_genasi_desc%, 17},
		}
	end
	if race == 2 then --elf
		sbSubraceData = {
			{%Zelf_title%, %bgelf%, 10},
			{%Zdrow_title%, %drow_desc%, 3},
			{%Zwild_elf_title%, %wild_elf_desc%, 4},
			{%Zmoon_elf_title%, %moon_elf_desc%, 11},
			{%Zfeyri_title%, %feyri_desc%, 12},
			{%Zsun_elf_title%, %sun_elf_desc%, 19},
			{%Zwood_elf_title%, %wood_elf_desc%, 20},
		}
	end
	if race == 3 then --halfelf
		sbSubraceData = {
			{%Zhalfelf_title%, %bghalfelf%, 10},
			{%Zhalfdrow_title%, %halfdrow_desc%, 13},
		}
	end
	if race == 4 then --dwarf
		sbSubraceData = {
			{%Zdwarf_title%, %bgdwarf%, 10},
			{%Zdwfgold_title%, %dwfgold_desc%, 5},
			{%Zdwfduerg_title%, %dwfduerg_desc%, 6},
		}
	end
	if race == 5 then --halfling
		sbSubraceData = {
			{%Zhalfling_title%, %bghalfling%, 10},
			{%Zhflstrong_title%, %hflstrong_desc%, 7},
			{%Zhflhide_title%, %hflhide_desc%, 8},
		}
	end
	if race == 6 then --gnome
		sbSubraceData = {
			{%Zgnome_title%, %bggnome%, 10},
			{%Zsvirfn_title%, %svirfn_desc%, 9},
		}
	end
	if race == 7 then --halforc
		sbSubraceData = {
			{%Zhalforc_title%, %bghalforc%, 10},
			{%Zhalfgrayorc_title%, %halfgrayorc_desc%, 18},
		}
	end
end
sbSubraceDataEx = {}
function createSubraceTableEx()
	sbSubraceDataEx = {
		{%Zaasimar_title%, %aasimar_desc%, 1},
		{%Ztiefling_title%, %tiefling_desc%, 2},
		{%Zdrow_title%, %drow_desc%, 3},
		{%Zwild_elf_title%, %wild_elf_desc%, 4},
		{%Zdwfgold_title%, %dwfgold_desc%, 5},
		{%Zdwfduerg_title%, %dwfduerg_desc%, 6},
		{%Zhflstrong_title%, %hflstrong_desc%, 7},
		{%Zhflhide_title%, %hflhide_desc%, 8},
		{%Zsvirfn_title%, %svirfn_desc%, 9},
		{0, 0, 10},
		{%Zmoon_elf_title%, %moon_elf_desc%, 11},
		{%Zfeyri_title%, %feyri_desc%, 12},
		{%Zhalfdrow_title%, %halfdrow_desc%, 13},
		{%Zair_genasi_title%, %air_genasi_desc%, 14},
		{%Zearth_genasi_title%, %earth_genasi_desc%, 15},
		{%Zfire_genasi_title%, %fire_genasi_desc%, 16},
		{%Zwater_genasi_title%, %water_genasi_desc%, 17},
		{%Zhalfgrayorc_title%, %halfgrayorc_desc%, 18},
		{%Zsun_elf_title%, %sun_elf_desc%, 19},
		{%Zwood_elf_title%, %wood_elf_esc%, 20},
	}
end
createSubraceTableEx()

function getRaceSubraceTitle(sbr)
	if sbr == 1 then
		return Infinity_FetchString(%select_subraceA%)
	else
		return t("RACE_TITLE")
	end
end

function getSubraceTitle(row)
	local text = sbSubraceData[row][1]
	return Infinity_FetchString(text)
end

function getSubraceDescription(row)
	local text = sbSubraceData[row][2]
	return Infinity_FetchString(text)
end

function onSubraceButton(buttonNum)
	C:SetGlobal("Pl_SUBRACE","GLOBAL",buttonNum)
end

function SubRaceOrGeneralHelp(sbr)
	if sbr == nil then
		return Infinity_FetchString(%select_sgenhlp%)
	else
		return Infinity_FetchString(sbSubraceData[sbr][2])
	end
end

function zzSubrClaickable()
	local race = chargen.races[currentChargenRace]
	if race then
		return true
	else
		return false
	end
end

function SubRaceAndRaceOrGeneralHelp(sbr)
	local race = chargen.races[currentChargenRace]
	if race then
		if (sbr > 0 and sbr ~= 10) then
			return Infinity_FetchString(race.desc) .. '\n\n________________________\n\n' .. Infinity_FetchString(sbSubraceDataEx[sbr][2])
		else
			return Infinity_FetchString(race.desc)
		end
	else
		return Infinity_FetchString(17237)
	end
end

zZraceStrings = {
	{nil, %bghuman_r%, 1},
	{nil, %bgelf_r%, 2},
	{nil, %bghalfelf_r%, 3},
	{nil, %bgdwarf_r%, 4},
	{nil, %bghalfling_r%, 5},
	{nil, %bggnome_r%, 6},
	{nil, %bghalforc_r%, 7},
}
--nil race subrace idx
zZsubraceStrings = {
	{nil, 1, %Ztext_aasimar%, 1},
	{nil, 1, %Ztext_tiefling%, 2},
	{nil, 2, %Ztext_drow%, 3},
	{nil, 2, %Ztext_wild_elf%, 4},
	{nil, 4, %Ztext_dwfgold%, 5},
	{nil, 4, %Ztext_dwfduerg%, 6},
	{nil, 5, %Ztext_hflstrong%, 7},
	{nil, 5, %Ztext_hflhide%, 8},
	{nil, 6, %Ztext_svirfn%, 9},
	{nil, 0, -1, 10},
	{nil, 2, %Ztext_moon_elf%, 11},
	{nil, 2, %Ztext_feyri%, 12},
	{nil, 3, %Ztext_halfdrow%, 13},
	{nil, 1, %Ztext_air_genasi%, 14},
	{nil, 1, %Ztext_earth_genasi%, 15},
	{nil, 1, %Ztext_fire_genasi%, 16},
	{nil, 1, %Ztext_water_genasi%, 17},
	{nil, 7, %Ztext_halfgrayorc%, 18},
	{nil, 2, %Ztext_sun_elf%, 19},
	{nil, 2, %Ztext_wood_elf%, 20},
}
function zzCreateCharInfo(info)
	local rc = 0
	local str, stra, strb = ''
	local x, y = 0, 0
	if currentChargenRace ~= nil and currSubrace > 0 and currSubrace ~= 10 then
		for k, v in pairs(zZraceStrings) do
			if currentChargenRace == v[3] then
				rc = v[3]
				str = Infinity_FetchString(v[2])
				break
			end
		end
		if rc > 0 then
			x, y = string.find(info, str, 1, true)
			if x ~= nil then
				stra = string.sub(info, 1, y)
				strb = string.sub(info, y + 1)
				for k, v in pairs(zZsubraceStrings) do
					if rc == v[2] and currSubrace == v[4] then
						info = stra .. ' ( ' .. Infinity_FetchString(v[3]) .. ' )' .. strb
					end
				end
			end
		end
	end
	return info
end

%higlihtseq%

%duifuc%


function zZrandomSubrace()
	local subr = math.random(1,2)
	if subr == 2 then
		createSubraceTable(chargen.races[currentChargenRace].id)
		currChargenSubrace = math.random(1, #sbSubraceData)
		currSubrace = sbSubraceData[currChargenSubrace][3]
		onSubraceButton(currSubrace)
	end
end
