execute store result score @s ulg_intick1 if data entity @s Inventory[].components."minecraft:custom_data".bp{Opened:1b}
if score @s ulg_intick1 matches 1 run function ulg:bp/sub/convert_openedbackpacks/player_inventory_case/single_case
if score @s ulg_intick1 matches 2.. run function ulg:bp/sub/convert_openedbackpacks/player_inventory_case/drop_all
