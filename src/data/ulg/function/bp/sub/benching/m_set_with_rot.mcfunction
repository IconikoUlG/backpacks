$summon minecraft:armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerable:1b,Silent:1b,NoGravity:1b,NoAI:1b,Tags:["ulg.backpackModifiable","ulg_intick163","ulg_intick71"],Rotation:[$(rot0)f,$(rot1)f]}
summon minecraft:interaction ~ ~ ~ {Tags:["ulg.backpackModifiable.hitbox","ulg_intick71"],width:0.8f,height:0.7f}

data modify entity @e[distance=..1,type=minecraft:armor_stand,tag=ulg_intick163,sort=nearest,limit=1] equipment.head set from entity @s Item
playsound minecraft:item.armor.equip_leather block @a[distance=..10] ~ ~ ~ 1 1 0.1

execute unless data entity @s Item.components."minecraft:custom_data".bp.newV run tag @e[tag=ulg_intick71] add ulg.mouldy_backpack

tag @e remove ulg_intick163
tag @e remove ulg_intick71
kill @s