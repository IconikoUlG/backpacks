from ./back_to_hand import ttag

prevHolder = "ulg_intick262"
$tag @p[scores={ulg_bp_using=$(uniq)}] add ulg_intick262

tellraw @p[tag=(prevHolder)] {"translate":"ulg.alert.no_drop_open","fallback":"You can't drop the backpack, it's still open!","color":"#ed7666"}

unless data entity @p[tag=(prevHolder)] equipment.offhand run return run function (~/case_offhand_free):
    item replace entity @p[tag=(prevHolder)] weapon.offhand from entity @n[tag=(ttag)] armor.head
    kill @s
    tag @a remove (prevHolder)

data modify entity @s Item set from entity @p[tag=(prevHolder)] equipment.offhand
item replace entity @p[tag=(prevHolder)] weapon.offhand from entity @n[tag=(ttag)] armor.head
tag @a remove (prevHolder)