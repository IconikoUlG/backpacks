# on weapon.offhand

data modify storage ulg:backpack intick.init26.item set from entity @s equipment.offhand
data modify storage ulg:backpack intick.init26.item.components."minecraft:custom_data".bp.newV set value 26

function ulg:bp/sub/init26/macro_set with storage ulg:backpack intick.init26.item.components."minecraft:custom_data".bp