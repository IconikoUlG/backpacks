execute if data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".ulg.BackPack unless data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".ulg.BackPack{newV:true} unless data entity @s Inventory[{Slot:-106b}].components{"minecraft:custom_model_data":822344} run item modify entity @s weapon.offhand ulg:make_mouldy_backpack


execute if score @s ulg_bk_usecar matches 1.. if data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".ulg.BackPack{newV:true} run function ulg:backpack/sub/use_backpack
execute if score @s ulg_bk_usecar matches 1.. if data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".ulg.BackPack unless data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".ulg.BackPack{newV:true} run tellraw @s {"translate":"ulg.alert.oldversionbackpack","color":"#ed7666","clickEvent": {"action":"open_url","value":"https://sites.google.com/view/ultroghasthub/datapacks/backpacks/open_mouldy_backpack","underlined":true}}

execute if data entity @s Inventory[].components."minecraft:custom_data".ulg.BackPack{Opened:1b} unless data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".ulg.BackPack{Opened:1b} run function ulg:backpack/sub/convert_openedbackpacks/player_inventory_case

execute if predicate ulg:is_sneaking anchored eyes if block ^ ^-0.3 ^1.3 #ulg:bp_backpacktables positioned ^ ^-0.3 ^1.3 align xyz positioned ~0.5 ~1 ~0.5 as @e[type=minecraft:armor_stand,tag=ulg.backpackModifiable,distance=..0.2] at @s run function ulg:backpack/sub/table_modify/remove

execute if data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".ulg.BackPack{newV:true} unless data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".ulg.BackPack{isLoreInit:true} run function ulg:backpack/sub/append_slots_lore

scoreboard players reset @s ulg_bk_usecar