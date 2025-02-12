data remove storage ulg:backpack intick

$data modify storage ulg:backpack intick.isLegacyBackpack set from entity @s Inventory[{Slot:$(Slot)b}].components."minecraft:custom_data".ulg.isLegacyBackpack
$data modify storage ulg:backpack intick.BackPackName set from entity @s Inventory[{Slot:$(Slot)b}].components."minecraft:custom_data".display.Name

execute in minecraft:overworld positioned 829999 -64 829999 run setblock ~ ~ ~ minecraft:barrel replace
execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~ ~ ~ Items set value []
execute in minecraft:overworld positioned 829999 -64 829999 run setblock ~-1 ~ ~ minecraft:barrel replace
execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~-1 ~ ~ Items set value []
$execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~ ~ ~ Items set from entity @s Inventory[{Slot:$(Slot)b}].components."minecraft:custom_data".bp.Inventory
execute in minecraft:overworld positioned 829999 -64 829999 run execute positioned ~-1 ~ ~ run function ulg:bp/sub/inventory_switch/from_as_to_at
execute in minecraft:overworld positioned 829999 -64 829999 run data modify storage ulg:backpack intick.BackPackInventory set from block ~-1 ~ ~ Items
execute in minecraft:overworld positioned 829999 -64 829999 run function ulg:bp/sub/inventory_switch/from_at_to_as

$item modify entity @s container.$(Slot) ulg:set_to_close
$item modify entity @s container.$(Slot) ulg:set_backpack_inventory

# set lore
$function ulg:bp/sub/set_lore/exe {Slot:$(Slot),containerString:"container.$(Slot)"}

title @s[tag=!ulg_knowsbackpack2] actionbar {"translate":"ulg.alert.auto_closed","color":"#ed7666"}
tag @s[tag=!ulg_knowsbackpack2] add ulg_knowsbackpack2