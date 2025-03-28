data modify storage ulg:macro prepare_slot_x.packet set value {type:"item",count:0,namespace:"minecraft",path:"unknown"}

data modify storage ulg:macro prepare_slot_x.packet.count set from storage ulg:macro prepare_slot_x.item.count

if data storage ulg:macro prepare_slot_x.item.components."minecraft:custom_name" run data modify storage ulg:macro prepare_slot_x.packet.custom_name set from storage ulg:macro prepare_slot_x.item.components."minecraft:custom_name"
if data storage ulg:macro prepare_slot_x.item.components."minecraft:custom_name" run return run function ulg:bp/sub/set_lore/prepare_slot_x/cnc_set with storage ulg:macro prepare_slot_x.packet

data modify storage ulg:macro prepare_slot_x.packet.id set string storage ulg:macro prepare_slot_x.item.id
data modify storage ulg:macro prepare_slot_x.packet.namespace set string storage ulg:macro prepare_slot_x.item.id 0 9
execute store result score @s ulg_intick1 run data modify storage ulg:macro prepare_slot_x.packet.namespace set value "minecraft"
execute unless score @s ulg_intick1 matches 0 run return run function ulg:bp/sub/set_lore/prepare_slot_x/modded_case

function ulg:bp/sub/set_lore/prepare_slot_x/default_case