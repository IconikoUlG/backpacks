data modify storage ulg:macro intick.rpmbp.data set from entity @s ArmorItems[3].components."minecraft:custom_data".ulg.BackPack.Inventory[0]
function ulg:backpack/sub/table_modify/drop_item_macro with storage ulg:macro intick.rpmbp

data remove entity @s ArmorItems[3].components."minecraft:custom_data".ulg.BackPack.Inventory[0]

execute if data entity @s ArmorItems[3].components."minecraft:custom_data".ulg.BackPack.Inventory[0] run function ulg:backpack/sub/table_modify/rpmbp_recursive