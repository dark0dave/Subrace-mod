
IF
	Global("Player_${PLAYER_NUMBER}_Change_Subrace","GLOBAL",0)
	Global("P${PLAYER_NUMBER}_SUBRACE","GLOBAL",$CHANGE)
THEN
	RESPONSE #100
		SetGlobal("P${PLAYER_NUMBER}_SUBRACE","GLOBAL", 999)
		SetGlobal("Player_${PLAYER_NUMBER}_Change_Subrace","GLOBAL",$CHANGE)
		ActionOverride(Player${PLAYER_NUMBER},SetGlobal("SUBRACE","LOCALS",$CHANGE))
		$SPELL
END
