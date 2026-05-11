from ./back_to_hand import ttag

prevHolder = "ulg_intick262"
$tag @p[scores={ulg_bp_using=$(uniq)}] add ulg_intick262

tellraw @p[tag=(prevHolder)] {"translate":"ulg.alert.no_drop_open","fallback":"You can't drop the backpack, it's still open!","color":"#ed7666"}
scoreboard players add @p[tag=(prevHolder)] ulg_bp_cheat 5

unless data entity @p[tag=(prevHolder)] equipment.offhand run return run function (~/case_offhand_free):
    item replace entity @p[tag=(prevHolder)] weapon.offhand from entity @n[tag=(ttag)] armor.head
    data remove entity @s Item
    kill @s[type=minecraft:item]
    tag @a remove (prevHolder)

data modify entity @s Item set from entity @p[tag=(prevHolder)] equipment.offhand
item replace entity @p[tag=(prevHolder)] weapon.offhand from entity @n[tag=(ttag)] armor.head

if data entity @s Item.components."minecraft:custom_data".bp.id if data entity @p[tag=(prevHolder)] equipment.offhand.components."minecraft:custom_data".bp.id:
    scoreboard players set $test.for.duplicate ulg_intick 1
    data modify storage ulg:macro test.for.duplicate.p set value {}
    data modify storage ulg:macro test.for.duplicate.p set from entity @p[tag=(prevHolder)] equipment.offhand.components."minecraft:custom_data".bp.id
    execute store result score $test.for.duplicate ulg_intick run data modify storage ulg:macro test.copy.p set from entity @s Item.components."minecraft:custom_data".bp.id
    if score $test.for.duplicate ulg_intick matches 0:
        scoreboard players add @p[tag=(prevHolder)] ulg_bp_cheat 10
        data remove entity @s Item
    data modify storage ulg:macro test.for.duplicate.p set value {}

tag @a remove (prevHolder)
