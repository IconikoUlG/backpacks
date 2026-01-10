scoreboard players add $ULG_BP_IDCOUNT ulg_gen 1
execute store result storage ulg:backpack intick.set_id.world int 1 run scoreboard players get $ULG_BP_WORLDID ulg_gen
execute store result storage ulg:backpack intick.set_id.uniq int 1 run scoreboard players get $ULG_BP_IDCOUNT ulg_gen

function ulg:bp/sub/init26/set_id_macro with storage ulg:backpack intick.set_id