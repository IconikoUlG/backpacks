$data modify storage ulg:backpack intick.bench.direct set from storage ulg:backpack table_modifs.backpackModels[{id:"$(currentModel)"}].directTransform."$(itemId)"

execute if data storage ulg:backpack intick.bench.direct.model run data modify entity @s ArmorItems[3].components."minecraft:item_model" set from storage ulg:backpack intick.bench.direct.model
execute if data storage ulg:backpack intick.bench.direct{clearLayers:true} run data modify entity @s ArmorItems[3].components."minecraft:custom_model_data".colors set value []

data modify entity @s ArmorItems[3].components."minecraft:custom_data".bp.dirty set value 1b
return 1