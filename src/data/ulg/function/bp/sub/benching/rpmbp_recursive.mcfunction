data modify storage ulg:macro intick.rpmbp.data set from entity @s ArmorItems[3].components."minecraft:custom_data".ulg.BackPack.Inventory[0]
function ulg:bp/sub/benching/drop_item_macro with storage ulg:macro intick.rpmbp

data remove entity @s ArmorItems[3].components."minecraft:custom_data".ulg.BackPack.Inventory[0]

if data entity @s ArmorItems[3].components."minecraft:custom_data".ulg.BackPack.Inventory[0] run function ulg:bp/sub/benching/rpmbp_recursive