execute if data storage ulg:macro table_modify{no_consume:true} run return 1

scoreboard players reset @s ulg_intick1
execute store result score @s ulg_intick1 run function ulg:backpack/sub/table_modify/sub/try_consume_macro with storage ulg:macro table_modify

execute if score @s ulg_intick1 matches 1.. run return 1
return fail