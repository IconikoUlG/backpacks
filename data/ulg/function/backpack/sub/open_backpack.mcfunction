#say function : open_backpack

#GIVE OPENED BACKPACK

data remove storage ulg:backpack intick

data modify storage ulg:backpack intick.BackPackDefaultCMD set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".ulg.BackPack.CustomModelData
data modify storage ulg:backpack intick.BackPackName set from entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".display.Name

execute store result score @s ulg_intick run data get storage ulg:backpack intick.BackPackDefaultCMD
scoreboard players add @s ulg_intick 1
execute store result storage ulg:backpack intick.BackPackCustomModelData int 1 run scoreboard players get @s ulg_intick

function ulg:backpack/sub/inventory_switch_on_bp_use
item modify entity @s weapon.offhand ulg:set_to_open
item modify entity @s weapon.offhand ulg:set_backpack_inventory

#FINALING
#loot replace entity @s weapon.offhand loot ulg:backpack/replace/opened_backpack

#tag @s add ulg_intick516

execute unless entity @s[tag=ulg_knowsbackpack] run tellraw @s {"translate":"ulg.alert.checkyourinventory","color":"#ed7666"}
tag @s[tag=!ulg_knowsbackpack] add ulg_knowsbackpack