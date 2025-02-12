execute if score @s ulg_intick matches -106 run return run data modify storage ulg:macro packet.cstring set value "weapon.offhand"
execute if score @s ulg_intick matches 103 run return run data modify storage ulg:macro packet.cstring set value "armor.helmet"
execute if score @s ulg_intick matches 102 run return run data modify storage ulg:macro packet.cstring set value "armor.chestplate"
execute if score @s ulg_intick matches 101 run return run data modify storage ulg:macro packet.cstring set value "armor.leggings"
execute if score @s ulg_intick matches 100 run return run data modify storage ulg:macro packet.cstring set value "armor.boots"

$data modify storage ulg:macro packet.cstring set value "container.$(cint)"