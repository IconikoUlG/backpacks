#$say auto_close_macro with Slot=$(Slot)

data remove storage ulg:backpack intick

# $data modify storage ulg:backpack intick.isLegacyBackpack set from entity @s Inventory[{Slot:$(Slot)b}].components."minecraft:custom_data".ulg.isLegacyBackpack
# $data modify storage ulg:backpack intick.BackPackName set from entity @s Inventory[{Slot:$(Slot)b}].components."minecraft:custom_data".display.Name

from @sub/use_backpack import switch_inventory
$data modify storage ulg:backpack intick.BackPackInventorySource set from entity @s Inventory[{Slot:$(Slot)b}].components."minecraft:custom_data".bp.Inventory
switch_inventory()
# execute in minecraft:overworld positioned 829999 -64 829999 run setblock ~ ~ ~ minecraft:barrel replace
# execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~ ~ ~ Items set value []
# execute in minecraft:overworld positioned 829999 -64 829999 run setblock ~-1 ~ ~ minecraft:barrel replace
# execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~-1 ~ ~ Items set value []
# $execute in minecraft:overworld positioned 829999 -64 829999 run data modify block ~ ~ ~ Items set from entity @s Inventory[{Slot:$(Slot)b}].components."minecraft:custom_data".bp.Inventory
# execute in minecraft:overworld positioned 829999 -64 829999 run execute positioned ~-1 ~ ~ run function ulg:bp/sub/inventory_switch/from_as_to_at
# execute in minecraft:overworld positioned 829999 -64 829999 run data modify storage ulg:backpack intick.BackPackInventory set from block ~-1 ~ ~ Items
# execute in minecraft:overworld positioned 829999 -64 829999 run function ulg:bp/sub/inventory_switch/from_at_to_as

from @jsons import IM_set_close, IM_set_inventory
raw f"$item modify entity @s container.$(Slot) {IM_set_close()}"
raw f"$item modify entity @s container.$(Slot) {IM_set_inventory()}"
scoreboard players reset @s ulg_bp_using

# set lore
$function ulg:bp/sub/set_container_comp/do {dataPath:"Inventory[{Slot:$(Slot)b}]",containerString:"container.$(Slot)"}

title @s[tag=!ulg_knowsbackpack2] actionbar {"translate":"ulg.alert.auto_closed","color":"#ed7666"}
tag @s[tag=!ulg_knowsbackpack2] add ulg_knowsbackpack2