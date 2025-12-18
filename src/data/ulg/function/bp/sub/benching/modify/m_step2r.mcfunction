##$say step_2r idx=$(idx) itemGroupId=$(itemGroupId)

$data modify storage ulg:macro tick.modify.c_layer set from storage ulg:macro tick.modify.layers[$(idx)]

$execute if data storage ulg:macro tick.modify.c_layer{accepts:["$(itemGroupId)"]} run function ulg:bp/sub/benching/modify/m_step2r_sub with storage ulg:macro table_modify_s2

scoreboard players add @s ulg_intick1 1
if score @s ulg_intick1 >= @s ulg_intick2 run return run function ulg:bp/sub/benching/modify/m_step3 with storage ulg:macro table_modify
execute store result storage ulg:macro table_modify_s2.idx int 1 run scoreboard players get @s ulg_intick1

return run function ulg:bp/sub/benching/modify/m_step2r with storage ulg:macro table_modify_s2