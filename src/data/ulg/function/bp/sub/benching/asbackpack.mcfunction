#if entity @a[distance=..5] run function ulg:bp/sub/benching/tick
if block ~ ~-0.1 ~ minecraft:air run function ulg:bp/sub/benching/remove

if score @s ulg_gen matches 0..:
    unless entity @a[distance=..10]:
        scoreboard players set @s ulg_gen -1

if data entity @s equipment.head.components."minecraft:custom_data".ulg.BackPack run function ulg:bp/sub/fix25/act_on_head