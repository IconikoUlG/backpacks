#if entity @a[tag=!global.ignore,distance=..5] run function ulg:bp/sub/benching/tick
if block ~ ~-0.1 ~ minecraft:air run function ulg:bp/sub/benching/remove

if data entity @s ArmorItems[3].components."minecraft:custom_data".ulg.BackPack run function ulg:bp/sub/fix25/act_on_head