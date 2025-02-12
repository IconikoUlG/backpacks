$data modify storage ulg:macro tick.oldCMD set from entity @s Inventory[{Slot:$(cint)b}].components."minecraft:custom_data".ulg.BackPack.CustomModelData

data modify storage ulg:macro packet set value {}

function ulg:bp/sub/fix25/conversion

$data modify storage ulg:macro packet.cstring set value $(cstring)
$data modify storage ulg:macro packet.cint set value $(cint)
data modify storage ulg:macro packet.string set value "closed"
data modify storage ulg:macro packet.opened set value "0"
$execute if data entity @s Inventory[{Slot:$(cint)b}].components."minecraft:custom_data".ulg.BackPack{Opened:1b} run data modify storage ulg:macro packet.string set value "opened"
$execute if data entity @s Inventory[{Slot:$(cint)b}].components."minecraft:custom_data".ulg.BackPack{Opened:1b} run data modify storage ulg:macro packet.opened set value "1"

$data modify storage ulg:backpack intick.BackPackInventory set from entity @s Inventory[{Slot:$(cint)b}].components."minecraft:custom_data".ulg.BackPack.Inventory

function ulg:bp/sub/fix25/m_act_final with storage ulg:macro packet