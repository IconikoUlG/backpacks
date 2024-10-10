execute if score #CAN_PLACE_BACKPACKS ulg_gen matches 1 as @s[tag=!global.ignore,nbt={Item:{components:{"minecraft:custom_data":{ulg:{BackPack:{Opened:0b}}}}}}] at @s if block ~ ~-0.3 ~ #ulg:bp_backpacktables align xyz positioned ~0.5 ~ ~0.5 run function ulg:backpack/sub/table_modify/set

execute as @s[tag=!global.ignore,nbt={Item:{components:{"minecraft:custom_data":{ulg:{BackPack:{Opened:1b}}}}}}] at @s run function ulg:backpack/sub/convert_openedbackpacks/item_tag_entity_case

execute if score #TABLE_BACKPACKS_TICK ulg_gen matches 1 as @s[type=minecraft:armor_stand,tag=ulg.backpackModifiable] at @s run function ulg:backpack/sub/table_modify/asbackpack
#execute as @s[type=minecraft:interaction,tag=ulg.backpackModifiable.hitbox] at @s if entity @a[tag=!global.ignore,distance=..4] run function ulg:backpack/sub/table_modify/tick_hitbox

execute as @s[type=player] at @s run function ulg:backpack/sel/player