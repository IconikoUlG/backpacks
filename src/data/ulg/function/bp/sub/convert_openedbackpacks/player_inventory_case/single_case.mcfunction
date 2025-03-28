##say try_auto_close

execute store result score @s ulg_intick run data get entity @s Inventory[{components:{"minecraft:custom_data":{bp:{Opened:1b}}}}].Slot 1
execute store result storage ulg:macro auto_close.Slot int 1 run scoreboard players get @s ulg_intick

if score @s ulg_intick matches 0..8 run function ulg:bp/sub/convert_openedbackpacks/player_inventory_case/try_auto_close
if score @s ulg_intick matches 9..35 run function ulg:bp/sub/convert_openedbackpacks/player_inventory_case/back_to_offhand_macro with storage ulg:macro auto_close

#function ulg:say_value with storage ulg:macro auto_close