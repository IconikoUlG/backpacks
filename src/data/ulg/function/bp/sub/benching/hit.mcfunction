#say tryonattack
from @builders import wrap, forcedef

@wrap(~/hit)
def hit():
    execute return 0

data modify storage ulg:backpack intick.check set from entity @s attack.player
scoreboard players set @s ulg_intick -1
execute store result score @s ulg_intick run data modify storage ulg:backpack intick.check set from entity @a[tag=ulg.intick.target,limit=1] UUID
if score @s ulg_intick matches 0 if entity @a[tag=ulg.intick.target] at @s as @e[tag=ulg.backpackModifiable,sort=nearest,limit=1] at @s unless function (~/hit) run function ulg:bp/sub/benching/remove

data modify entity @s interaction set value {}