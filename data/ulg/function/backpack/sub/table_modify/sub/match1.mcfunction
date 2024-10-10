$data modify storage ulg:macro table_modify.to set from storage ulg:backpack table_modifs.specifics[{item:"$(itemId)",from:$(currentModel)}].to

$execute if data storage ulg:backpack table_modifs.specifics[{item:"$(itemId)",from:$(currentModel),no_consume:true}] run data modify storage ulg:macro table_modify.no_consume set value true