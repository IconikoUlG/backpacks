summon minecraft:marker ~ ~ ~ {Tags:["ulg.intick.96"]}
execute as @n[tag=ulg.intick.96] at @s facing entity @p eyes rotated ~ 0 run tp @s ~ ~ ~ ~ ~
#execute store result storage ulg:macro intick.set_with_rot.rot0 float 1 run data get entity @n[tag=ulg.intick.96] Rotation[0]
execute store result storage ulg:macro intick.set_with_rot.rot1 float 1 run data get entity @n[tag=ulg.intick.96] Rotation[1]

# START rotation correction
execute store result score #tryplace.rot0 ulg_intick run data get entity @n[tag=ulg.intick.96] Rotation[0]
scoreboard players operation #tryplace.rot0 ulg_intick *= #10 ulg_gen
scoreboard players operation #tryplace.resto ulg_intick = #tryplace.rot0 ulg_intick
scoreboard players operation #tryplace.resto ulg_intick %= #225 ulg_gen
scoreboard players operation #tryplace.rot0 ulg_intick -= #tryplace.resto ulg_intick
if score #tryplace.resto ulg_intick >= #112 ulg_gen run scoreboard players add #tryplace.rot0 ulg_intick 225
execute store result storage ulg:macro intick.set_with_rot.rot0 float 0.1 run scoreboard players get #tryplace.rot0 ulg_intick
# END rotation correction

kill @e[tag=ulg.intick.96]

function (~/m_set_with_rot):
    $summon minecraft:armor_stand ~ ~ ~ {Marker:1b,Invisible:1b,Invulnerable:1b,Silent:1b,NoGravity:1b,NoAI:1b,Tags:["ulg.backpackModifiable","ulg_intick163","ulg_intick71"],Rotation:[$(rot0)f,$(rot1)f]}
    summon minecraft:interaction ~ ~ ~ {Tags:["ulg.backpackModifiable.hitbox","ulg_intick71"],width:0.8f,height:0.7f}

    data modify entity @e[distance=..1,type=minecraft:armor_stand,tag=ulg_intick163,sort=nearest,limit=1] equipment.head set from entity @s Item
    playsound minecraft:item.armor.equip_leather block @a[distance=..10] ~ ~ ~ 1 1 0.1

    execute unless data entity @s Item.components."minecraft:custom_data".bp.newV run tag @e[tag=ulg_intick71] add ulg.mouldy_backpack

    tag @e remove ulg_intick163
    tag @e remove ulg_intick71
    kill @s
function (~/m_set_with_rot) with storage ulg:macro intick.set_with_rot