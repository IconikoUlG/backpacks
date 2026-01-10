ttag = "ulg_intick8360"

summon minecraft:armor_stand ~ -1 ~ {Marker:1b,Invisible:1b,Tags:[(ttag)],Invulnerable:1b,NoGravity:1b}
data modify entity @n[tag=(ttag)] equipment.head set from entity @s Item

function (./back_to_hand_macro) with entity @s Item.components."minecraft:custom_data".bp.id

kill @e[type=minecraft:armor_stand,tag=(ttag)]