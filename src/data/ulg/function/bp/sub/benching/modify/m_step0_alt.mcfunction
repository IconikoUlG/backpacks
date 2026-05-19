$data modify storage ulg:backpack intick.bench.direct set from storage ulg:backpack table_modifs.backpackModels[{id:"$(currentModel)"}].directTransform."$(itemId)"

if data storage ulg:backpack intick.bench.direct.model run data modify entity @s equipment.head.components."minecraft:item_model" set from storage ulg:backpack intick.bench.direct.model
if data storage ulg:backpack intick.bench.direct{clearLayers:true} run data modify entity @s equipment.head.components."minecraft:custom_model_data".colors set value []

data modify storage ulg:macro table_modify.didModify set value true

# data modify entity @s equipment.head.components."minecraft:custom_data".bp.dirty set value 1b
return run function ulg:bp/sub/benching/modify/m_step3 with storage ulg:macro table_modify