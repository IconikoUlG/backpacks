$data modify storage ulg:macro table_modify.to set from storage ulg:backpack table_modifs.tagged[{item:"$(itemId)",tags:["$(backpackTag)"]}].cmd

$execute if data storage ulg:backpack table_modifs.tagged[{item:"$(itemId)",tags:["$(backpackTag)"],no_consume:true}] run data modify storage ulg:macro table_modify.no_consume set value true