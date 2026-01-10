unless score $ULG_BP_WORLDID ulg_gen matches 1..:
    store result score $ULG_BP_WORLDID ulg_gen run random value 1..99999
    scoreboard players set $ULG_BP_IDCOUNT ulg_gen 0

execute unless data entity @s equipment.offhand.components."minecraft:custom_data".bp.id.uniq run return run function ulg:bp/sub/init26/set_id

execute store result storage ulg:backpack intick.id_check.worldID int 1 run scoreboard players get $ULG_BP_WORLDID ulg_gen
scoreboard players set @s ulg_intick 0
execute store result score @s ulg_intick run data modify storage ulg:backpack intick.id_check.worldID set from entity @s equipment.offhand.components."minecraft:custom_data".bp.id.world

execute unless score @s ulg_intick matches 0 run function ulg:bp/sub/init26/set_id