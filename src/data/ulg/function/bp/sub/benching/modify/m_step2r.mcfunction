# $say step_2r idx=$(idx) itemGroupId=$(itemGroupId)

# iteration:
# - set current layer
# - if current layer accepts item: run m_step2r_sub
# - intick1++, if did all -> redirect to m_step3
# - otherwise, set new idx in packet and continue

$data modify storage ulg:macro tick.modify.c_layer set from storage ulg:macro tick.modify.layers[$(idx)]

# if data storage macro do select = true, if layer is valid: 
#    if current idx <= current selection (ulg_gen) -> continue/donothing, else redirect to select (current selection = current idx)
$execute if data storage ulg:macro table_modify{doSelect:true} if score @s ulg_intick1 > @s ulg_gen if data storage ulg:macro tick.modify.c_layer{accepts:["$(itemGroupId)"]} run return run function ulg:bp/sub/benching/modify/m_step2r_select with storage ulg:macro table_modify_s2
$execute unless data storage ulg:macro table_modify{doSelect:true} if score @s ulg_gen matches -1 if data storage ulg:macro tick.modify.c_layer{accepts:["$(itemGroupId)"]} run function ulg:bp/sub/benching/modify/m_step2r_modify with storage ulg:macro table_modify_s2
$execute unless data storage ulg:macro table_modify{doSelect:true} if score @s ulg_gen = @s ulg_intick1 if data storage ulg:macro tick.modify.c_layer{accepts:["$(itemGroupId)"]} run function ulg:bp/sub/benching/modify/m_step2r_modify with storage ulg:macro table_modify_s2

scoreboard players add @s ulg_intick1 1
if score @s ulg_intick1 >= @s ulg_intick2 run return run function ulg:bp/sub/benching/modify/m_step3 with storage ulg:macro table_modify
execute store result storage ulg:macro table_modify_s2.idx int 1 run scoreboard players get @s ulg_intick1

return run function ulg:bp/sub/benching/modify/m_step2r with storage ulg:macro table_modify_s2