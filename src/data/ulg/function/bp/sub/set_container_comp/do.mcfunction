# say set_container_comp_do

# dataPath: -> string, ex equipment.offhand
# containerString: -> string, ex container.0 / weapon.offhand

$data modify storage ulg:macro set_container_comp set value {dataPath:"$(dataPath)",containerString:$(containerString)}

$data modify storage ulg:macro set_container_comp.inventory set from entity @s $(dataPath).components."minecraft:custom_data".bp.Inventory
execute store result score @s ulg_intick run data get storage ulg:macro set_container_comp.inventory

$execute if score @s ulg_intick matches ..0 run return run function ulg:bp/sub/set_container_comp/empty {containerString:$(containerString)}

# with inventory
$data modify storage ulg:macro set_container_comp.packet set value {dataPath:"$(dataPath)",containerString:$(containerString),x:0}
scoreboard players remove @s ulg_intick 1
execute store result storage ulg:macro set_container_comp.packet.x int 1 run scoreboard players get @s ulg_intick

data modify storage ulg:macro set_container_comp.container set value []
function ulg:bp/sub/set_container_comp/iter with storage ulg:macro set_container_comp.packet