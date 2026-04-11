#!/usr/bin/env bash
set -euo pipefail

generate() {
  export PLAYER_NUMBER=${1}
  declare -A spells
  spells[1]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_AASIM\",Player${PLAYER_NUMBER}))"
  spells[2]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_TIEFL\",Player${PLAYER_NUMBER}))"
  spells[3]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_DROW\",Player${PLAYER_NUMBER}))"
  spells[4]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_EWILD\",Player${PLAYER_NUMBER}))"
  spells[5]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_DWGLD\",Player${PLAYER_NUMBER}))"
  spells[6]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_DUERG\",Player${PLAYER_NUMBER}))"
  spells[7]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_HLSTR\",Player${PLAYER_NUMBER}))"
  spells[8]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_HLGHO\",Player${PLAYER_NUMBER}))"
  spells[9]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_SVIRF\",Player${PLAYER_NUMBER}))"
  spells[10]=""
  spells[11]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_FEYRI\",Player${PLAYER_NUMBER}))"
  spells[12]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_HDROW\",Player${PLAYER_NUMBER}))"
  spells[13]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_AGENA\",Player${PLAYER_NUMBER}))"
  spells[14]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_EGENA\",Player${PLAYER_NUMBER}))"
  spells[15]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_FGENA\",Player${PLAYER_NUMBER}))"
  spells[16]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_WGENA\",Player${PLAYER_NUMBER}))"
  spells[17]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_HGROC\",Player${PLAYER_NUMBER}))"
  spells[18]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_ESUN\",Player${PLAYER_NUMBER}))"
  spells[19]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_EWOOD\",Player${PLAYER_NUMBER}))"
  spells[20]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_EDUSK\",Player${PLAYER_NUMBER}))"
  spells[21]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_ELYTH\",Player${PLAYER_NUMBER}))"
  spells[22]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_ESNOW\",Player${PLAYER_NUMBER}))"
  spells[23]="ActionOverride(Player${PLAYER_NUMBER},ApplySpellRES(\"SR_WSPLG\",Player${PLAYER_NUMBER}))"

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
