#say function : close_backpack

#GIVE CLOSED BACKPACK

data remove storage ulg:backpack intick

data modify storage ulg:backpack intick.isLegacyBackpack set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".ulg.isLegacyBackpack
data modify storage ulg:backpack intick.restoringCMD set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".ulg.BackPack.CustomModelData
data modify storage ulg:backpack intick.BackPackName set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".display.Name
#data modify storage ulg:backpack intick.BackPackInventory set from entity @s Inventory

function ulg:backpack/sub/inventory_switch_on_bp_use
item modify entity @s weapon.offhand ulg:set_to_close
item modify entity @s weapon.offhand ulg:set_backpack_inventory

# set lore
function ulg:backpack/sub/set_lore/exe {Slot:-106,containerString:"weapon.offhand"}

#FINALING
#loot replace entity @s weapon.offhand loot ulg:backpack/replace/backpack
