#say function : use_backpack

execute if data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".ulg.BackPack{Opened:false} run tag @s add ulg_intick516
execute as @s[tag=ulg_intick516] run function ulg:backpack/sub/open_backpack
execute as @s[tag=!ulg_intick516] if data entity @s Inventory[{Slot:-106b}].components."minecraft:custom_data".ulg.BackPack{Opened:true} run function ulg:backpack/sub/try_close_backpack
tag @s remove ulg_intick516