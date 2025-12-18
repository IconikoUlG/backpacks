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

function ulg:bp/sub/benching/m_set_with_rot with storage ulg:macro intick.set_with_rot