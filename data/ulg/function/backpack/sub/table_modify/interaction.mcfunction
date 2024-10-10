execute as @s[tag=ulg.mouldy_backpack] if data entity @a[tag=ulg.intick.target,limit=1] SelectedItem{id:"minecraft:mace"} run return run function ulg:backpack/sub/table_modify/repair_mouldy_backpack

execute if score #CAN_MODIFY_BACKPACKS ulg_gen matches 0 run return fail
execute unless data entity @a[tag=ulg.intick.target,limit=1] SelectedItem run return fail

data modify storage ulg:macro table_modify set value {no_consume:false}
data modify storage ulg:macro table_modify.currentModel set from entity @s ArmorItems[3].components."minecraft:custom_data".ulg.BackPack.CustomModelData
data modify storage ulg:macro table_modify.itemId set from entity @a[tag=ulg.intick.target,limit=1] SelectedItem.id
data modify storage ulg:macro table_modify.itemCount set from entity @a[tag=ulg.intick.target,limit=1] SelectedItem.count
data modify storage ulg:macro table_modify.itemComponents set from entity @a[tag=ulg.intick.target,limit=1] SelectedItem.components
data modify storage ulg:macro table_modify.backpackTag set value "unknown"

return run function ulg:backpack/sub/table_modify/sub/try_modify_macro with storage ulg:macro table_modify