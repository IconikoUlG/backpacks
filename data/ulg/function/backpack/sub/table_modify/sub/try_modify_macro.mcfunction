$data modify storage ulg:macro table_modify.backpackTag set from storage ulg:backpack table_modifs.tag_map.$(currentModel)

execute store result score #match ulg_intick run function ulg:backpack/sub/table_modify/sub/find_match with storage ulg:macro table_modify
execute unless score #match ulg_intick matches 1.. run return fail

execute if score #match ulg_intick matches 1 run function ulg:backpack/sub/table_modify/sub/match1 with storage ulg:macro table_modify
execute if score #match ulg_intick matches 2 run function ulg:backpack/sub/table_modify/sub/match2 with storage ulg:macro table_modify

execute unless function ulg:backpack/sub/table_modify/sub/can_modify run return fail

item modify entity @s armor.head ulg:table_modify

#execute if score @s ulg_intick1 matches 1.. run return 1
#return fail
return 1