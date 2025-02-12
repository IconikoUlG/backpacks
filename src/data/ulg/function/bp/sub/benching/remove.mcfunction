particle minecraft:dust{color:[1.000,0.827,0.129],scale:0.5} ~ ~0.4 ~ 0.2 0.2 0.2 1 20 normal @a[distance=..6,tag=ulg.intick.target]

summon minecraft:item ~ 0 ~ {Tags:["ulg_intick151","global.ignore"],Item:{id:"minecraft:carrot",count:1b}}
data modify entity @e[type=item,tag=ulg_intick151,limit=1] Item set from entity @s ArmorItems[3]

kill @e[type=interaction,tag=ulg.backpackModifiable.hitbox,distance=..0.1,sort=nearest,limit=1]
kill @s

tp @e[type=item,tag=ulg_intick151,limit=1] ~ ~0.3 ~

tag @e remove ulg_intick151