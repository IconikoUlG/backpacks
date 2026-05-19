##say step1
# #$say step1 = $(itemGroupId)

# step 1
# - ensure at least one layer accepts the item group
# - prepare tick.modify and ulg_intick1/2 for iteration

$execute unless data storage ulg:backpack table_modifs.backpackModels[{id:"$(currentModel)"}].layers[{accepts:["$(itemGroupId)"]}] run return fail

$data modify storage ulg:macro tick.modify.layers set from storage ulg:backpack table_modifs.backpackModels[{id:"$(currentModel)"}].layers

$data modify storage ulg:macro tick.modify.colorEntry set from storage ulg:backpack table_modifs.itemGroups[{values:[{item:"$(itemId)"}]}].values[{item:"$(itemId)"}]

scoreboard players set @s ulg_intick1 0
execute store result score @s ulg_intick2 if data storage ulg:macro tick.modify.layers[]
# scoreboard players operation $bp.lastvalue ulg_intick = @s ulg_intick2
# scoreboard players remove $bp.lastvalue ulg_intick 1
# execute if score @s ulg_gen >= $bp.lastvalue ulg_intick run scoreboard players set @s ulg_gen -1

return run function ulg:bp/sub/benching/modify/step2