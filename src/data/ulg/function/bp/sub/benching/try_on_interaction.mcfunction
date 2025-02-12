data modify storage ulg:backpack intick.check set from entity @s interaction.player
scoreboard players set @s ulg_intick 10
execute store result score @s ulg_intick run data modify storage ulg:backpack intick.check set from entity @a[tag=ulg.intick.target,limit=1] UUID
execute if score @s ulg_intick matches 0 if entity @a[tag=ulg.intick.target] at @s as @e[tag=ulg.backpackModifiable,sort=nearest,limit=1] at @s unless function ulg:bp/sub/benching/interaction run function ulg:bp/sub/benching/cremove