data modify entity @s Item.components."minecraft:custom_data".bp.Opened set value false
data modify entity @s Item.components."minecraft:custom_model_data".strings set value ["closed"]

particle minecraft:dust{color:[1.000,0.827,0.129],scale:1} ~ ~ ~ 0.1 0.1 0.1 1 20 normal @a[distance=..6]
tellraw @a[distance=..4] {"translate":"ulg.alert.changedinventory","color":"#ed7666"}

function ulg:bp/sub/convert_openedbackpacks/item_tag_entity_case/try_remove_backpacks
function ulg:bp/sub/convert_openedbackpacks/item_tag_entity_case/try_remove_shulker_boxes