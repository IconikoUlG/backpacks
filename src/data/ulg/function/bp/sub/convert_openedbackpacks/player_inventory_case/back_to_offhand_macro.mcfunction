execute in minecraft:overworld positioned 829999 -64 829999 run setblock ~ ~ ~ minecraft:barrel replace
execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~ ~ ~ Items set value [{Slot:0b,id:"minecraft:carrot",count:1,components:{}}]
execute in minecraft:overworld positioned 829999 -64 829999 run setblock ~-1 ~ ~ minecraft:barrel replace
execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~-1 ~ ~ Items set value []

$execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~ ~ ~ Items[0].id set from entity @s Inventory[{Slot:$(Slot)b}].id
$execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~ ~ ~ Items[0].count set from entity @s Inventory[{Slot:$(Slot)b}].count
$execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~ ~ ~ Items[0].components set from entity @s Inventory[{Slot:$(Slot)b}].components
execute in minecraft:overworld positioned 829999 -64 829999 run item replace block ~-1 ~ ~ container.0 from entity @s weapon.offhand

execute in minecraft:overworld positioned 829999 -64 829999 run item replace entity @s weapon.offhand from block ~ ~ ~ container.0
$execute in minecraft:overworld positioned 829999 -64 829999 run item replace entity @s container.$(Slot) from block ~-1 ~ ~ container.0

tellraw @s {"translate":"ulg.alert.still_open","color":"#ed7666"}