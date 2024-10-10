#say interact with tabled

execute as @s run tag @s add ulg.intick.target

execute as @s at @s positioned ^ ^ ^2 as @e[tag=ulg.backpackModifiable.hitbox,distance=..2,sort=nearest,limit=1] if data entity @s interaction.player at @s run function ulg:backpack/sub/table_modify/try_on_interaction

advancement revoke @s only ulg:backpack/interact_with_tabled_backpack
execute as @s run tag @s remove ulg.intick.target