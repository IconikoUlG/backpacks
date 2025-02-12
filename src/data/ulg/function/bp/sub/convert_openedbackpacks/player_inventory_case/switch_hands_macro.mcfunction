$$(command)
execute unless data entity @s Inventory[{Slot:-106b}].id run return run function ulg:bp/sub/convert_openedbackpacks/player_inventory_case/switch_hands_simple

execute in minecraft:overworld positioned 829999 -64 829999 run setblock ~ ~ ~ minecraft:barrel replace
execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~ ~ ~ Items set value [{Slot:0b,id:"minecraft:carrot",count:1,components:{}}]

execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~ ~ ~ Items[0].id set from entity @s Inventory[{Slot:-106b}].id
execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~ ~ ~ Items[0].count set from entity @s Inventory[{Slot:-106b}].count
execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~ ~ ~ Items[0].components set from entity @s Inventory[{Slot:-106b}].components

item replace entity @s weapon.offhand from entity @s weapon.mainhand
execute in minecraft:overworld positioned 829999 -64 829999 run item replace entity @s weapon.mainhand from block ~ ~ ~ container.0