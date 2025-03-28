# #say fafga

data modify storage ulg:macro tick.oldCMD set from entity @s ArmorItems[3].components."minecraft:custom_data".ulg.BackPack.CustomModelData

data modify storage ulg:macro packet set value {}

function ulg:bp/sub/fix25/conversion

data modify storage ulg:backpack intick.BackPackInventory set from entity @s ArmorItems[3].components."minecraft:custom_data".ulg.BackPack.Inventory

function ulg:bp/sub/fix25/m_act_on_head_final with storage ulg:macro packet