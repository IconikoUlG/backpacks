#execute if entity @a[tag=!global.ignore,distance=..5] run function ulg:backpack/sub/table_modify/tick
execute if block ~ ~-0.1 ~ minecraft:air run function ulg:backpack/sub/table_modify/remove
