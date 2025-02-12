summon minecraft:marker ~ ~ ~ {Tags:["ulg.intick.96"]}
execute as @n[tag=ulg.intick.96] at @s facing entity @p eyes rotated ~ 0 run tp @s ~ ~ ~ ~ ~
execute store result storage ulg:macro intick.set_with_rot.rot0 float 1 run data get entity @n[tag=ulg.intick.96] Rotation[0]
execute store result storage ulg:macro intick.set_with_rot.rot1 float 1 run data get entity @n[tag=ulg.intick.96] Rotation[1]

kill @e[tag=ulg.intick.96]

function ulg:bp/sub/benching/m_set_with_rot with storage ulg:macro intick.set_with_rot