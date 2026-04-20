#!/usr/bin/env bash
set -euo pipefail

generate() {
  export PLAYER_NUMBER=${1}
  declare -A spells
  spells[1]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_AASIM\",Player${PLAYER_NUMBER}))"
  spells[2]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_TIEFL\",Player${PLAYER_NUMBER}))"
  spells[3]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_DROW\",Player${PLAYER_NUMBER}))"
  spells[4]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_EWILD\",Player${PLAYER_NUMBER}))"
  spells[5]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_DWGLD\",Player${PLAYER_NUMBER}))"
  spells[6]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_DUERG\",Player${PLAYER_NUMBER}))"
  spells[7]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_HLSTR\",Player${PLAYER_NUMBER}))"
  spells[8]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_HLGHO\",Player${PLAYER_NUMBER}))"
  spells[9]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_SVIRF\",Player${PLAYER_NUMBER}))"
  spells[10]=""
  spells[11]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_FEYRI\",Player${PLAYER_NUMBER}))"
  spells[12]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_HDROW\",Player${PLAYER_NUMBER}))"
  spells[13]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_AGENA\",Player${PLAYER_NUMBER}))"
  spells[14]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_EGENA\",Player${PLAYER_NUMBER}))"
  spells[15]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_FGENA\",Player${PLAYER_NUMBER}))"
  spells[16]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_WGENA\",Player${PLAYER_NUMBER}))"
  spells[17]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_HGROC\",Player${PLAYER_NUMBER}))"
  spells[18]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_ESUN\",Player${PLAYER_NUMBER}))"
  spells[19]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_EWOOD\",Player${PLAYER_NUMBER}))"
  spells[20]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_EDUSK\",Player${PLAYER_NUMBER}))"
  spells[21]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_ELYTH\",Player${PLAYER_NUMBER}))"
  spells[22]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_ESNOW\",Player${PLAYER_NUMBER}))"
  spells[23]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"ZD_WSPLG\",Player${PLAYER_NUMBER}))"

  for i in {1..23}; do
    export CHANGE=${i}
    export SPELL=${spells[${i}]}
    envsubst < .github/scripts/append_gen.tpl
  done

  unset $PLAYER_NUMBER
  unset $CHANGE
  unset $SPELL
}

main() {
  for player in {1..6}; do
    echo """// -------------------------------------------
// Player ${player}
// -------------------------------------------
IF
	Global(\"Player_${player}_Change_Subrace\",\"GLOBAL\",0)
	Global(\"P${player}_SUBRACE\",\"GLOBAL\", 0)
THEN
	RESPONSE #100
		SetGlobal(\"P${player}_SUBRACE\",\"GLOBAL\", 999)
		SetGlobal(\"Player_${player}_Change_Subrace\",\"GLOBAL\",10)
		ActionOverride(Player1,SetGlobal(\"SUBRACE\", \"LOCALS\",10))
END"""
    generate "${player}"
  done
}

main
