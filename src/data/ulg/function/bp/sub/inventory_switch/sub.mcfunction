setblock ~ ~ ~ minecraft:barrel replace
data modify block ~ ~ ~ Items set value []
setblock ~-1 ~ ~ minecraft:barrel replace
data modify block ~-1 ~ ~ Items set value []

data modify block ~ ~ ~ Items set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".bp.Inventory

execute positioned ~-1 ~ ~ run function ulg:bp/sub/inventory_switch/from_as_to_at

data modify storage ulg:backpack intick.BackPackInventory set from block ~-1 ~ ~ Items
#item modify entity @s weapon.offhand ulg:set_backpack_inventory

function ulg:bp/sub/inventory_switch/from_at_to_as