##say step 0

execute unless score @s ulg_gen matches -1..10 run scoreboard players set @s ulg_gen -1

#ulg:macro table_modify has value {no_consume:false}
#ulg:macro table_modify.currentModel has from entity @s ArmorItems[3].components."minecraft:item_model"
#ulg:macro table_modify.itemId has from entity @a[tag=ulg.intick.target,limit=1] SelectedItem.id
#ulg:macro table_modify.itemCount has from entity @a[tag=ulg.intick.target,limit=1] SelectedItem.count
# cut?: ulg:macro table_modify.itemComponents has from entity @a[tag=ulg.intick.target,limit=1] SelectedItem.components

$if data storage ulg:backpack table_modifs.backpackModels[{id:"$(currentModel)"}].directTransform."$(itemId)" run return run function ulg:bp/sub/benching/modify/m_step0_alt with storage ulg:macro table_modify

$execute unless data storage ulg:backpack table_modifs.backpackModels[{id:"$(currentModel)"}].layers run return fail

data modify storage ulg:macro table_modify.itemGroupId set value "null"
$data modify storage ulg:macro table_modify.itemGroupId set from storage ulg:backpack table_modifs.itemGroups[{values:[{item:"$(itemId)"}]}].id
if data storage ulg:macro table_modify{itemGroupId:"null"} run return fail

return run function ulg:bp/sub/benching/modify/m_step1 with storage ulg:macro table_modify