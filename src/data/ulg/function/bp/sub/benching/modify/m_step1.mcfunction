#say step1

$execute unless data storage ulg:backpack table_modifs.backpackModels[{id:"$(currentModel)"}].layers[{accepts:["$(itemGroupId)"]}] run return fail

$data modify storage ulg:macro tick.modify.layers set from storage ulg:backpack table_modifs.backpackModels[{id:"$(currentModel)"}].layers
$data modify storage ulg:macro tick.modify.colorEntry set from storage ulg:backpack table_modifs.itemGroups[{values:[{item:"$(itemId)"}]}].values[{item:"$(itemId)"}]

scoreboard players set @s ulg_intick1 0
execute store result score @s ulg_intick2 run execute if data storage ulg:macro tick.modify.layers[]

return run function ulg:bp/sub/benching/modify/step2