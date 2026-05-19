$scoreboard players set @s ulg_gen $(idx)
# $say set select = $(idx)
data modify storage ulg:macro table_modify.didSelect set value true

title @p[gamemode=!spectator,distance=..6] actionbar {"translate":"ulg.alert.editing","fallback":"Editing: %s","with":[{"storage":"ulg:macro","nbt":"tick.modify.c_layer.label","interpret":true}]}

# ulg:macro tick.modify.c_layer
return 1