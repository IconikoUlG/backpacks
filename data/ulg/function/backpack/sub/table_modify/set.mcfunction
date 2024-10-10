summon minecraft:armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerable:1b,Silent:1b,NoGravity:1b,NoAI:1b,Tags:["ulg.backpackModifiable","ulg_intick163","ulg_intick71"]}
summon minecraft:interaction ~ ~ ~ {Tags:["ulg.backpackModifiable.hitbox","ulg_intick71"],width:0.8f,height:0.7f}

data modify entity @e[distance=..1,type=minecraft:armor_stand,tag=ulg_intick163,sort=nearest,limit=1] ArmorItems[3] set from entity @s Item
execute as @e[distance=..1,type=minecraft:armor_stand,tag=ulg_intick163,sort=nearest,limit=1] positioned as @s run tp @s ~ ~ ~ ~ 0

execute unless data entity @s Item.components."minecraft:custom_data".ulg.BackPack{newV:true} run tag @e[tag=ulg_intick71] add ulg.mouldy_backpack

tag @e remove ulg_intick163
tag @e remove ulg_intick71
kill @s