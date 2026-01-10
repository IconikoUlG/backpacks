# $say iter x=$(x)
#{dataPath:$(dataPath),containerString:$(containerString),x:0}

$execute if score #-1 ulg_gen matches $(x).. run return run function ulg:bp/sub/set_container_comp/finally with storage ulg:macro set_container_comp

$data modify storage ulg:macro set_container_comp.x_item set value {slot:$(x),item:{}}
$data modify storage ulg:macro set_container_comp.x_item.item set from storage ulg:macro set_container_comp.inventory[$(x)]
data modify storage ulg:macro set_container_comp.container prepend from storage ulg:macro set_container_comp.x_item

scoreboard players remove @s ulg_intick 1
execute store result storage ulg:macro set_container_comp.packet.x int 1 run scoreboard players get @s ulg_intick

return run function ulg:bp/sub/set_container_comp/iter with storage ulg:macro set_container_comp.packet