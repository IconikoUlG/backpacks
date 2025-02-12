execute store result score @s ulg_intick run data get entity @s Inventory[{components:{"minecraft:custom_data":{ulg:{BackPack:{newV:true}}}}}].Slot

data modify storage ulg:macro packet.cint set from entity @s Inventory[{components:{"minecraft:custom_data":{ulg:{BackPack:{newV:true}}}}}].Slot
function ulg:bp/sub/fix25/m_define_cstring with storage ulg:macro packet

function ulg:bp/sub/fix25/m_act_sub with storage ulg:macro packet