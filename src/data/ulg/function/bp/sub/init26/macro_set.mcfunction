
# $loreSize = previous lore size

$item modify entity @s weapon.offhand \
[{"function":"minecraft:set_lore","lore":[],"mode":"replace_section","offset":0,"size":$(loreSize)},\
{function:"minecraft:set_custom_data",components:{},tag:{bp:{newV:26}},conditions:[]}]
